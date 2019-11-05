require 'rack'
require './basic'

use Basic

class Sample
  def call(env)
    [ 200, { 'Content-Type' => 'text/plain' }, ["Hello, World\n"] ]
  end
end

run Sample.new
