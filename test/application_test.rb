# frozen_string_literal: true

require_relative "test_helper"

class RulersTestApp < Rulers::Application
end

class AppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  # Define the Rack application under test
  def app
    RulersTestApp.new
  end

  def test_hello_world_response
    # Perform a GET request to the root path
    get "/"

    # Assert the response status
    assert_equal 200, last_response.status, "Expected HTTP status 200"

    # Assert the response content type
    assert_equal "text/html", last_response.headers["Content-Type"], "Expected Content-Type to be 'text/html'"
  end
end
