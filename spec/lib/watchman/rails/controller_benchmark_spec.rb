require "spec_helper"

RSpec.describe Watchman::Rails::ControllerBenchmark do

  # Controllers for testing

  class ApplicationController < ActionController::Base
    include Watchman::Rails::ControllerBenchmark
  end

  class UsersController < ApplicationController
    def show
      render :json => { "hello" => "world" }
    end
  end

  module Admin
  end

  class Admin::UsersController < ApplicationController
    def show
      render :json => { "hello" => "world" }
    end
  end

  it "benchmarks controller actions" do
    measurment_name = "rails.controllers.users.show"

    expect(Watchman).to receive(:benchmark).with(measurment_name).and_call_original

    UsersController.action("show").call(
      "REQUEST_METHOD" => "GET",
      "rack.input" => -> {})
  end

  it "includes namespace in the nemtric name" do
    measurment_name = "rails.controllers.admin_users.show"

    expect(Watchman).to receive(:benchmark).with(measurment_name).and_call_original

    Admin::UsersController.action("show").call(
      "REQUEST_METHOD" => "GET",
      "rack.input" => -> {})
  end
end
