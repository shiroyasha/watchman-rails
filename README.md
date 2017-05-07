# Watchman Rails

[![Gem Version](https://badge.fury.io/rb/watchman-rails.svg)](https://badge.fury.io/rb/watchman-rails)
[![Build Status](https://semaphoreci.com/api/v1/shiroyasha/watchman-rails/branches/master/badge.svg)](https://semaphoreci.com/shiroyasha/watchman-rails)

[Watchman](https://github.com/renderedtext/watchman) extensions for Rails applications.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'watchman-rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install watchman-rails

## Usage

### Controllers

Inject the `Watchman::Rails::ControllerBenchmark` into your application's
controller in order to collect benchmarks.

``` ruby
class ApplicationController < ActiveController::Base
  include Watchman::Rails::ControllerBenchmark
end
```

When included the duration of every action in each controller will be collected.
For example, if you have a `UsersController` controller with a `show` action:

``` ruby
class Userscontroller < Applicationcontroller
  def show
    render :json => { "name" => "Peter Parker" }
  end
end
```

When a request arrives, the following benchmark metric will be saved:

``` txt
rails.controllers.users.show
```

In the generic case, the following metric will be generated for your
controllers:

``` ruby
rails.controllers.<controller_name>.<action>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then,
run `rake spec` to run the tests. You can also run `bin/console` for an
interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file
to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/shiroyasha/watchman-rails. This project is intended to be a
safe, welcoming space for collaboration, and contributors are expected to adhere
to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of
the [MIT License](http://opensource.org/licenses/MIT).
