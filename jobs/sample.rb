current_temp = 0

SCHEDULER.every '2s' do

  response = Net::HTTP.get(URI.parse("http://api.cosm.com/v2/feeds/96292/datastreams/2.csv?key=l7Y9EZ-oLtZ_SDgf55VxivoPTKOSAKx5ZXI2N1JHS1hrOD0g"))

  comma = response.index(',')

  last_temp = current_temp
  current_temp = response.slice(comma + 1,6)

  send_event('karma', { current: current_temp, last: last_temp })
end
