require 'sinatra'
require 'omniauth'
require 'omniauth-twitter'
require 'dotenv'

Dotenv.load
enable :sessions

use OmniAuth::Builder do
  provider :twitter, ENV["CONSUMER_KEY"], ENV["CONSUMER_SECRET"], callback_url: ENV["CALLBACK"]
end

get "/" do
  return "<a href='/auth/twitter'>check twitter api key</a>"
end

get "/auth/:provider/callback" do
  pp request
end
