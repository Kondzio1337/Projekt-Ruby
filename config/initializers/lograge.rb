Rails.application.configure do

  #Wlaczamy lograge
  config.lograge.enabled=true

  config.lograge.formatter = Lograge::Formatters::Json.new
  #opcje dołączane do kazdego logu
  config.lograge.custom_options = lambda do |event|
    {
      time: Time.now,
      host: event.payload[:host],
      remote_ip: event.payload[:remote_ip],
      user_id: event.payload[:user_id],
    }
  end




end