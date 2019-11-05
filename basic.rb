require 'base64'

class Basic
  def initialize(app)
    @app = app
  end

  def call(env)
    res = @app.call(env)
    res
  end
end
