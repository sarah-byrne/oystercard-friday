require_relative 'journey'

class JourneyLog
  attr_reader :journeys

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(entry_station)
    @current_journey = @journey_class.new(entry_station)
  end


  def finish(exit_station)
    @journeys << current_journey.finish(exit_station)
  end

  def last
    @journeys.last
  end

  def journeys
    @journeys.dup
  end 

  private

  def current_journey
    if @current_journey == nil || @current_journey.ending_station != nil
      @journey_class.new
    else
      @current_journey
    end
  end

end
