module WeatherbaseApi
  class HistoricWeather
    attr_accessor :name, :average_temperature, :days_above_90, :days_below_32, :average_humidity

    def initialize(name, avg_temp, days_above_90, days_below_32, avg_humidity)
      self.name                = name
      self.average_temperature = avg_temp
      self.days_above_90       = days_above_90
      self.days_below_32       = days_below_32
      self.average_humidity    = avg_humidity
    end

    def self.client
      WeatherbaseApi::Client.new
    end

    def self.find_for(location)
      client.weather_for(location).collect_data
    end
  end
end