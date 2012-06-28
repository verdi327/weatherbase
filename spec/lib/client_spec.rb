require 'spec_helper'

describe WeatherbaseApi::Client do
  let(:client) { WeatherbaseApi::Client.new }

  describe "#weather_for" do
    it "finds the correct location" do
      page = client.weather_for('denver')
      page.location_name.downcase.should include('denver')
    end
  end

  describe "#locations_for" do
    it "finds the possible matches for a loction string" do
      client.locations_for('denver').should == "http://www.weatherbase.com/search/search.php3?query=denver"
    end
  end

  # describe "#url_for" do
  #   it "puts the location into the generated URL" do
  #     client.url_for('denver').should == "http://www.weatherbase.com/search/search.php3?query=denver"
  #   end
  # end

end


# Notes
#
# client = WeatherbaseApi::Client.new
# weather_page = client.weather_for('denver')
# weather_page.annual_high_temperature