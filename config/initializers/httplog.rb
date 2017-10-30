=begin
HttpLog.configure do |config|
    
      # Enable or disable all logging
      config.enabled = true
    
      # You can assign a different logger
      config.logger = Logger.new($stdout)
    
      # I really wouldn't change this...
      config.severity = Logger::Severity::DEBUG
    
      # Tweak which parts of the HTTP cycle to log...
      config.log_connect   = true
      config.log_request   = true
      config.log_headers   = false
      config.log_data      = true
      config.log_status    = true
      config.log_response  = true
      config.log_benchmark = true
    
      # ...or log all request as a single line by setting this to `true`
      config.compact_log = false
    
      # Prettify the output - see below
      config.color = false
    
      # Limit logging based on URL patterns
      config.url_whitelist_pattern = /.*/
      config.url_blacklist_pattern = nil
    end
    
=begin
D, [2017-10-27T18:01:59.432113 #16400] DEBUG -- : [httplog] Connecting: lookups.twilio.com:443
D, [2017-10-27T18:01:59.809106 #16400] DEBUG -- : [httplog] Sending: GET http://lookups.twilio.com:443/v1/PhoneNumbers/+17787140588?Type=carrier
D, [2017-10-27T18:01:59.809352 #16400] DEBUG -- : [httplog] Data:
D, [2017-10-27T18:02:00.192947 #16400] DEBUG -- : [httplog] Status: 200
D, [2017-10-27T18:02:00.193218 #16400] DEBUG -- : [httplog] Benchmark: 0.38343 seconds
D, [2017-10-27T18:02:00.193730 #16400] DEBUG -- : [httplog] Response:

{
"caller_name":null,
"country_code":"CA",
"phone_number":"+17787140588",
"national_format":"(778) 714-0588",
"carrier":{
"mobile_country_code":"302",
"mobile_network_code":"490",
"name":"Freedom Mobile Inc.",
"type":"mobile",
"error_code":null
},
"add_ons":null,
"url":"https://lookups.twilio.com/v1/PhoneNumbers/+17787140588?Type=carrier"
}
=end