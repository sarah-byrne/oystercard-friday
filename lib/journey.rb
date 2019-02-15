class Journey
  attr_reader :state, :starting_station, :ending_station

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
    return 6 if @starting_station == nil
    return 6 if @ending_station == nil
    1
  end

end
