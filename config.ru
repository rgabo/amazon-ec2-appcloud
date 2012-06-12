require "bundler/setup"
require "showoff"
require "sinatra"

configure do
  require 'redis'
  uri = URI.parse(ENV["REDISTOGO_URL"] || "redis://localhost:6379")
  REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end

get '/hi' do
  "Hello world!"
end

get '/counter' do
  @counter = REDIS.incr("counter")
  haml :counter
end

use Sinatra::Application
run ShowOff.new
