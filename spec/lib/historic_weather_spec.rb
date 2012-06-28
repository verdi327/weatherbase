require 'spec_helper'

describe WeatherbaseApi::HistoricWeather do
  describe ".find_for" do
    it 'returns an instance of itself' do
      result = WeatherbaseApi::HistoricWeather.find_for('denver')
      result.should be_a(WeatherbaseApi::HistoricWeather)
    end
  end
end