# SpaghettiSquash

SpagettiSquash is the story of me making better an app with page after page of interlinked ActiveRecord callbacks triggering each other.

## Installation

Add this line to your application's Gemfile:

    gem 'spaghetti_squash', group: :development

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spaghetti_squash

## Usage

Right now, all it does it log the beginning and end of all they callbacks, so you can see what's going on.

For example

````
% rails c                                                                                                                                                                           ✹
Loading development environment (Rails 4.1.4)
(development on MarketMaker) irb(main):001:0> User.last.save
  User Load (18.0ms)  SELECT  "users".* FROM "users"   ORDER BY "users"."id" DESC LIMIT 1
   (0.8ms)  BEGIN
  User Exists (14.5ms)  SELECT  1 AS one FROM "users"  WHERE ("users"."email" = 'example@example.com' AND "users"."id" != 1) LIMIT 1
starting callback: save [:standardize_for_search] {}
finishing callback
   (0.3ms)  COMMIT
=> true
(development on MarketMaker) irb(main):002:0>

````

It should only log callbacks that originate from your code, but this might break if you vendor gems or your Rails.root is somewhere strange.

It probably slows down your app a lot.

## Requirements

I'm developing this against Rails 4.1, but I'd accept bugs against any Rails 4 version.

## In the future

Printing out a tree structure, and counting call backs per-request (or save, or something).

Some tools to help you pull callbacks into seperate objects that can, one hopes, be refactored away.

Who knows.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/spaghetti_squash/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
