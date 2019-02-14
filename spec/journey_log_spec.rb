require 'journey_log'
describe JourneyLog do

  it 'starts a new journey' do

    station_double = double :station
    journey_double = double :journey
    journey_class_double = double :journey_class, new: journey_double
    log = JourneyLog.new(journey_class_double)
    log.start(station_double)
    expect(log.journeys).to include(journey_double)
  end

  

end
