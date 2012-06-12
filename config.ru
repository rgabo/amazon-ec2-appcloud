require "bundler/setup"
require "redis"
require "showoff"
require "sinatra"

redis = Redis.new

get '/hi' do
  "Hello world!"
end

get '/counter' do
  @counter = redis.incr("counter")
  haml :counter
end

use Sinatra::Application
run ShowOff.new
