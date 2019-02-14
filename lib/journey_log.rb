class JourneyLog
  attr_reader :journeys
  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(entry_station)
    @journeys << @journey_class.new(entry_station)

  end
end
