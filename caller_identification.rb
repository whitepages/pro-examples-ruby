require 'open-uri'
require 'json'

params = {
  'phone' => '6464806649',
  'api_key' => ENV['CALLER_ID_API_KEY']
}

uri = URI('https://proapi.whitepages.com/3.0/caller_identification')
uri.query = URI.encode_www_form(params)

response_hash = JSON.parse(open(uri).read)

puts response_hash
