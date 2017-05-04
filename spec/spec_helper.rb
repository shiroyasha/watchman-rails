require "bundler/setup"
require "watchman/rails"

require "action_controller"
require "watchman"

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
