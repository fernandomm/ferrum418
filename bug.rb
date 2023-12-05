url = ARGV.first || raise('URL is required')

puts "Testing with url #{url}"

puts "Number of sessions (initial): #{JSON.parse(RestClient.get("#{url}/sessions")).length}"

browser = Ferrum::Browser.new(url: url)

puts "Number of sessions (before browser.quit): #{JSON.parse(RestClient.get("#{url}/sessions")).length}"

browser.quit

puts "Number of sessions (after browser.quit): #{JSON.parse(RestClient.get("#{url}/sessions")).length}"