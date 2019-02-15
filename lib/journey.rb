class Journey
  attr_reader :state, :starting_station, :ending_station

  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize(starting_station = nil)
    @state = "started"
    @starting_station = starting_station
  end

  def finish(ending_station = nil)
    @ending_station = ending_station
    @state = "finished"
    self
  end

  def complete?
    return true if @state == "finished"
    false
  end

  def fare
    return PENALTY_FARE if
      @starting_station == nil || @ending_station == nil
    MIN_FARE
  end

end
