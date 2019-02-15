require 'journey_log'
describe JourneyLog do

  it 'starts a new journey' do
    station_double = double :station
    journey_double = double :journey
    allow(journey_double).to receive(:ending_station).and_return(nil)
    journey_class_double = double :journey_class, new: journey_double
    log = JourneyLog.new(journey_class_double)
    log.start(station_double)
    expect(log.send(:current_journey)).to eq journey_double
  end

  it 'adds the journey to the journey log if the journey is finished' do
    station_double = double :station
    journey_double = double :journey
    allow(journey_double).to receive(:finish).and_return(journey_double)
    allow(journey_double).to receive(:ending_station).and_return(station_double)
    journey_class_double = double :journey_class, new: journey_double
    log = JourneyLog.new(journey_class_double)
    log.start(station_double)
    log.finish(station_double)
    expect(log.journeys).to include(journey_double)
  end

  describe ".current_journey" do
    it "returns a new journey if there is not a current journey" do
      journey_double = double :journey
      journey_class_double = double :journey_class, new: journey_double
      log = JourneyLog.new(journey_class_double)
      expect(log.send(:current_journey)).to eq journey_double
    end
  end
end
