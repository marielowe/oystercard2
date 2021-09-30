class Oyster_card
  MAXIMUM_BALANCE = 20
  MINIMUM_CHARGE = 1
  attr_reader :balance
  attr_reader :in_journey, :entry_station, :exit_station,
              :journeys, :completed_journey

  def initialize
    @balance = 0
    @in_journey = false
    @journeys = []
    @completed_journey = {}
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient funds" if @balance < MINIMUM_CHARGE
    @entry_station = station
    @in_journey = true
  end

  def touch_out(station)
    deduct(MINIMUM_CHARGE)
    @exit_station = station
    @in_journey = false
  end

  def store_journeys
    @completed_journey["entry station"] = @entry_station
    @completed_journey["exit station"] = @exit_station
    @completed_journey
  end

  def in_journey?
    !!in_journey
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
