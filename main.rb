require 'faraday'
require 'faraday/net_http'

# Usage: ruby main.rb
# TWITTER_API_BEARER_TOKEN must be set in the environment

conn = Faraday.new(
  url: 'https://api.twitter.com/2',
  headers: {'Authorization' => "Bearer #{ENV['TWITTER_API_BEARER_TOKEN']}"}
) do |f|
  f.response :json
  f.adapter :net_http
end

tweet_id = 123

response = conn.get('tweets', ids: tweet_id)

puts response
