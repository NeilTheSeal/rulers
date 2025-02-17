module Rulers
  class Application
    def get_controller_and_action(env)
      _, cont, action, after = env["PATH_INFO"].split("/", 4)
      cont = cont.capitalize
      cont += "Controller"

      obj = Object.const_get(cont)

      [obj, action]
    end
  end
end
