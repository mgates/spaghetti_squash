require "spaghetti_squash/version"

module SpaghettiSquash
  module Patch
    module ClassMethods
      def set_callback(name, *filter_list, &block)
        super name, *filter_list do
         type, filters, options = self.class.normalize_callback_params(filter_list, block)
          if in_app?(filters.first)
             ActiveRecord::Base.logger.info "starting callback: #{name} #{filters} #{options}"
          end
        end
        super
        super name, *filter_list do
          type, filters, options = self.class.normalize_callback_params(filter_list, block)
          if in_app?(filters.first)
            Rails.logger.info "finishing callback"
          end
        end
      end
    end

    def in_app?(proc_or_symbol)
      if proc_or_symbol.respond_to?(:source_location)
        path = proc_or_symbol.source_location.first
      elsif proc_or_symbol.is_a?(Symbol)
        path = self.method(proc_or_symbol).source_location.first
      else
        path = ''
      end

      path = Pathname.new path

      in_app = false
      path.ascend {|p| in_app = true if p === Rails.root}
      in_app
    end

    def self.prepended(base)
      base.singleton_class.send :prepend, ClassMethods
    end
  end
  class Railtie < Rails::Railtie
    ActiveSupport.on_load :active_record do
      ActiveRecord::Base.send :prepend, SpaghettiSquash::Patch
    end
  end
end
