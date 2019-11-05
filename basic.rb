require 'base64'

class Basic
  USERNAME = "HOGE"
  PASSWORD = "FUGA"
  UNAUTHORIZED = [401, { "Content-Type" => "text/html", "WWW-Authenticate" => "Basic" }, ["BASIC Auth required.\n"]]
  def initialize(app)
    @app = app
  end

  def call(env)
    res = @app.call(env)
    _, head = env["HTTP_AUTHORIZATION"].split(' ')
    return UNAUTHORIZED unless head

    user, pass = Base64.decode64(head).split(':')
    if user == USERNAME && pass == PASSWORD
      res
    else
      UNAUTHORIZED
    end
  end
end
