[![Build Status](https://travis-ci.org/readiness-it/qat-db.svg?branch=master)](https://travis-ci.org/readiness-it/qat-db)

# QAT::DB

- Welcome to the QAT DB gem!

- This gem is an extension of Sequel gem that support different types of of database connections management:
  - **Create and manage database connections;**
  - **PostgreSQL database support;**
  - **Oracle database support.**

## Installation

Add this line to your application's Gemfile:
```ruby
gem 'qat-db'
```
And then execute:
 
    $ bundle install
 
Or install it yourself as:
 
    $ gem install qat-db
 
## Usage
```ruby
require 'qat-db'
```
In order to use this gem and all the functionalities it is necessary to have a file ```database.yml``` in the path ```"/config/your_environment/"```:
```yaml
postgres:
  host: 'your_host_address'
  port: 8080
  database: 'test'
  username: 'test'
  password: 't3st'
  adapter: 'postgres'
oracle:
  host: 'your_host_address'
  port: 8080
  database: 'xe'
  username: 'system'
  password: 'oracle'
  adapter: 'oracle'
```

# Documentation

- [API documentation](https://readiness-it.github.io/qat-db/)


For more information check [Sequel gem documentation](https://github.com/jeremyevans/sequel).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/readiness-it/qat-db. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the QAT::DB project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/readiness-it/qat-db/blob/master/CODE_OF_CONDUCT.md).
