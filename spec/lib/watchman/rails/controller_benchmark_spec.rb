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
    expect(Watchman).to receive(:benchmark).with("rails.controllers", :tags => ["users", "show"]).and_call_original

    UsersController.action("show").call(
      "REQUEST_METHOD" => "GET",
      "rack.input" => -> {})
  end

  it "includes namespace in the nemtric name" do
    expect(Watchman).to receive(:benchmark).with("rails.controllers", :tags => ["admin_users", "show"]).and_call_original

    Admin::UsersController.action("show").call(
      "REQUEST_METHOD" => "GET",
      "rack.input" => -> {})
  end
end
