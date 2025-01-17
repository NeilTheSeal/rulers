# frozen_string_literal: true

require_relative "rulers/array"
require_relative "rulers/version"
require_relative "rulers/routing"

module Rulers
  class Error < StandardError; end

  class Application
    def call(env)
      return [404, { "Content-Type" => "text/html" }, []] if env["PATH_INFO"] == "/favicon.ico"

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      [
        200,
        { "content-type" => "text/html" },
        [text]
      ]
    end
  end

  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end
  end
end
