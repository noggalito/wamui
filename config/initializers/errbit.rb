Airbrake.configure do |config|
  config.api_key = 'ef15403a41a954326d5cc770137b82aa'
  config.host    = 'pangi.shiriculapo.com'
  config.port    = 80
  config.secure  = config.port == 443
end
