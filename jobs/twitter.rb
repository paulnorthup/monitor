require 'net/http'
require 'json'


SCHEDULER.every '10s', :first_in => 0 do |job|
  http = Net::HTTP.new('api.cosm.com')
  response = Net::HTTP.get(URI.parse("http://api.cosm.com/v2/feeds/96292/datastreams/2.csv?key=l7Y9EZ-oLtZ_SDgf55VxivoPTKOSAKx5ZXI2N1JHS1hrOD0g"))
  send_event('twitter_mentions', comments: response)
end
