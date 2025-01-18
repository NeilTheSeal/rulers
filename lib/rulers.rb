# frozen_string_literal: true

require_relative "rulers/version"
require_relative "rulers/routing"
require_relative "rulers/util"
require_relative "rulers/dependencies"
require_relative "rulers/controller"

module Rulers
  class Error < StandardError; end

  class Application
    def call(env)
      if env["PATH_INFO"] == "/favicon.ico"
        return [404, { "content-type" => "text/html" }, []]
      end

      env["PATH_INFO"] = "/index/index" if env["PATH_INFO"] == "/"

      if %r{^/[a-z0-9_-]+/?$}i.match?(env["PATH_INFO"])
        if env["PATH_INFO"][-1] == "/"
          env["PATH_INFO"] = env["PATH_INFO"][0...-1]
        end

        env["PATH_INFO"] = "#{env["PATH_INFO"]}/index"
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)

      [200, { "content-type" => "text/html" }, [text]]
    end
  end

  def self.framework_root
    __dir__
  end
end
