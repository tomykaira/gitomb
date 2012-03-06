# Gitomb

gitomb is a thin wrapper of [Milkode](http://milkode.ongaeshi.me/wiki/Main_Page).

gitomb enhances the ability for searching 3rd party library source.

You can get the library's source with just 1 copy-paste and 1 click, then can search the whole library within a second.

## Setup

- Download this repository.
- Install bundler(`gem install bundler`).
  Bundler 1.1 is not available now, because of Milkode's gemspec problem.
- `bundle install`
- `bundle exec rake init` to initialize Milkode database.  **If you are already using Milkode, skip this step**.
- `bundle exec rackup` to startup server.
- Access `localhost:9292` from a browser.
