# frozen_string_literal: true

require_relative "rulers/array"
require_relative "rulers/version"

module Rulers
  class Error < StandardError; end

  class Application
    def call(env)
      `echo debug > debug.txt`
      [
        200,
        { "content-type" => "text/html" },
        ["Hello Rack contrib!"]
      ]
    end
  end
end
