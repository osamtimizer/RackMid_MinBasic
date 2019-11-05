require 'base64'
require 'yaml'

class Basic

  UNAUTHORIZED = [401, { "Content-Type" => "text/html", "WWW-Authenticate" => "Basic" }, ["BASIC Auth required.\n"]]
  CONFIG = YAML.load_file(File.join(__dir__, 'config.yml'))

  def initialize(app)
    @app = app
  end

  def call(env)
    res = @app.call(env)
    _, head = env["HTTP_AUTHORIZATION"].split(' ')
    return UNAUTHORIZED unless head

    user, pass = Base64.decode64(head).split(':')
    if user == CONFIG["username"] && pass == CONFIG["password"]
      res
    else
      UNAUTHORIZED
    end
  end
end
