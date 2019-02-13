class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MINIMUM_CHARGE = 1

  attr_reader :balance, :entry_station, :journeys

  def initialize
    @balance = 0
    @in_journey = false
    @journeys = []

  end

  def top_up(amount)
    fail 'Max balance of #{max_balance} exceeded' if amount + balance > MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def be_in_journey
    @in_journey
  end

  def touch_in(entry_station = nil)
    raise "The money is not enough in card." if balance <= MIN_BALANCE
    @in_journey = true
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_CHARGE)
    @journeys << {entry_station: entry_station, exit_station: exit_station}
    @in_journey = false
    @entry_station = nil

  end

  private :deduct


end
