require_relative 'journey_log'

class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  attr_reader :balance,  :journey_log
  def initialize(journey_log = JourneyLog.new)
    @balance = 0
    @journey_log = journey_log
  end

  def top_up(amount)
    fail "Max balance of #{MAX_BALANCE} exceeded" if amount + balance > MAX_BALANCE
    @balance += amount
  end

  def touch_in(entry_station = nil)
    raise "The money is not enough in card." if balance <= MIN_BALANCE
    @journey_log.start(entry_station)
  end

  def touch_out(exit_station)
    @journey_log.finish(exit_station)
    deduct(@journey_log.last.fare)
  end

  def show_journeys
    journeys = journey_log.journeys 
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
