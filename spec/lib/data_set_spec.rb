require 'spec_helper'

describe WeatherbaseApi::DataSet do
  let(:denver_dataset) { Nokogiri::HTML(File.open('spec/fixtures/denver_weather.html')) }
  let(:data_set) { WeatherbaseApi::DataSet.new(denver_dataset) }

  describe '#location_name' do
    it "returns the page's city name" do
      data_set.location_name.downcase.should include("denver")
    end
  end

  describe '#average_annual_temperature' do
    it "finds the right value" do
      data_set.average_annual_temperature.should == "51"
    end
  end

  describe '#average_number_of_days_above_90' do
    it "finds the right value" do
      data_set.average_number_of_days_above_90.should == "34"
    end
  end

  describe '#average_number_of_days_below_32' do
    it "finds the right value" do
      data_set.average_number_of_days_below_32.should == "155"
    end
  end

  describe '#average_morning_relative_humidity' do
    it "finds the right value" do
      data_set.average_morning_relative_humidity.should == "66"
    end
  end

  describe '#collect_data' do
    it "returns a historic weather object" do
      data_set.collect_data.should be_a(WeatherbaseApi::HistoricWeather)
    end
  end

end