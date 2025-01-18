# frozen_string_literal: true

require_relative "rulers/version"
require_relative "rulers/routing"
require_relative "rulers/util"
require_relative "rulers/dependencies"

module Rulers
  class Error < StandardError; end

  class Application
    def call(env)
      if env["PATH_INFO"] == "/favicon.ico"
        return [404, { "content-type" => "text/html" }, []]
      end

      env["PATH_INFO"] = "/index/index" if env["PATH_INFO"] == "/"

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)

      [200, { "content-type" => "text/html" }, [text]]
    end
  end

  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end
  end
end
