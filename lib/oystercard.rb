class Oyster_card
  MAXIMUM_BALANCE = 20
  MINIMUM_CHARGE = 1
  attr_reader :balance
  attr_reader :entry_station, :exit_station, :journeys, :completed_journey

  def initialize
    @balance = 0
    @entry_station
    @exit_station
    @journeys = []
    @completed_journey = []
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient funds" if @balance < MINIMUM_CHARGE
    @entry_station = station
    @completed_journey << station
    true
  end

  def touch_out(station)
    deduct(MINIMUM_CHARGE)
    @entry_station = nil
    @completed_journey << station
    @journeys << @completed_journey
  end

  def in_journey?
    !!@entry_station
  end

  # def check_balance
  #   @balance
  # end

  private

  def deduct(amount)
    @balance -= amount
  end
end
