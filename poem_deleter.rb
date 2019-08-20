require 'twitter'
require 'dotenv'

Dotenv.load

client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['CONSUMER_KEY']
  config.consumer_secret = ENV['CONSUMER_SECRET']
  config.access_token = ENV['ACCESS_TOKEN']
  config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
end

count = 0
100.times do
  client.user_timeline(count: 1000).each do |tweet|
    puts "--- " + tweet.id.to_s + ":" + tweet.user.name + " : " + tweet.user.screen_name + " ---"
    puts tweet.text
    next if tweet.text.include?("https")
    client.destroy_status(tweet.id)
    puts "Success"
    count += 1
  end
end

puts "Delete Tweet: " + count.to_s
