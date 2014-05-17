require 'yelp'
require 'oauth'


Yelp.client.configure do |config|
  config.consumer_key = 'yYsRpyhdZMPBHkcnIkOvoA'
  config.consumer_secret = 'lIFiykpM6f4YSvbUicgEvLDjgjY'
  config.token = 'RnxWizvF-iNnIyRKa79fjKKPNDG5wsz5'
  config.token_secret = 'r71htia1tMBglmtpvufLEHy6uK4'
end

api_host = 'api.yelp.com'
 
consumer = OAuth::Consumer.new('yYsRpyhdZMPBHkcnIkOvoA', 'lIFiykpM6f4YSvbUicgEvLDjgjY', {:site => "http://#{api_host}"})
access_token = OAuth::AccessToken.new(consumer, 'RnxWizvF-iNnIyRKa79fjKKPNDG5wsz5', 'r71htia1tMBglmtpvufLEHy6uK4')

path = "/v2/search?term=bar%20trivia&location=santa%20monica"


p access_token.get(path).body