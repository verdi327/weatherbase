module WeatherbaseApi
  class Client
    attr_reader :agent

    def initialize
      @agent = Mechanize.new
    end

    def weather_for(location)
      #fetch page with correct url with location for all possible matches
      #click one of the matches
      #returns an object representing the data
      agent.get locations_for(location)
      agent.page.link_with(:text => location.capitalize).click
      DataSet.new(agent.page)
    end

    def locations_for(location)
      "http://www.weatherbase.com/search/search.php3?query=#{location}"
    end

  end

  class DataSet
    attr_reader :page

    def initialize(page_data)
      @page = page_data
    end

    def location_name
      page.search("#left-content h1").first.text
    end

    def average_annual_temperature
      page.search("table:nth-child(3) .data").first.text
    end

    def average_number_of_days_above_90
      page.search("table:nth-child(17) .data").first.text
    end

    def average_number_of_days_below_32
      page.search("table:nth-child(19) .data").first.text
    end

    def average_morning_relative_humidity
      page.search("table:nth-child(27) .data").first.text
    end

    def collect_data
      name          = location_name
      avg_temp      = average_annual_temperature
      days_above_90 = average_number_of_days_above_90
      days_below_32 = average_number_of_days_below_32
      avg_humidity  = average_morning_relative_humidity
      WeatherbaseApi::HistoricWeather.new(name, avg_temp, days_above_90, days_below_32, avg_humidity)
    end
  end
end