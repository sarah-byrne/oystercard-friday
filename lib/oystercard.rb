class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MINIMUM_CHARGE = 1

  attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false

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

  def touch_in
    raise "The money is not enough in card." if balance <= MIN_BALANCE
    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @in_journey = false
  end

  private :deduct 


end
