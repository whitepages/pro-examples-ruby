require 'open-uri'
require 'json'

params = {
  'name' => 'Drama Number',
  'phone' => '6464806649',
  'email_address' => 'medjalloh1@yahoo.com',
  'address_city' => 'Ashland',
  'address.postal_code' => '59004',
  'address.state_code' => 'MT',
  'address.country_code' => 'US',
  'address.street_line_1' => '302 Gorham Ave',
  'ip_address' => '108.194.128.165',
  'api_key' => ENV['LEAD_VERIFY_API_KEY']
}

uri = URI('https://proapi.whitepages.com/3.3/lead_verify.json')
uri.query = URI.encode_www_form(params)

response_hash = JSON.parse(open(uri).read)

available_checks = %w(phone_checks address_checks email_address_checks ip_address_checks)

available_checks.each { |check| puts response_hash.fetch(check) }
