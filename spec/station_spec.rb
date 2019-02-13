require 'station'

describe Station do
  it 'checks if station class has a name and a zone' do
    station = Station.new('oxford', 1)
    expect(station.name).to eq 'oxford'
    expect(station.zone).to eq 1
  end

end
