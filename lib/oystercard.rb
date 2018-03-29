class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  FARE = 1
  DEFAULT_BALANCE = 0
  TOP_UP_AMOUNT = 10

  attr_accessor :balance
  attr_reader   :entry_station, :exit_station, :journeys

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journeys = []
  end

  def top_up(amount)
    too_high_balance_error if balance_too_high(amount)
    @balance += amount
  end

  def in_journey?
    true unless @entry_station.nil?
  end

  def touch_in(entry_station)
    too_low_balance_error if balance_too_low?
    @entry_station = entry_station
    @in_journey = true
  end

  def touch_out(exit_station)
    @in_journey = false
    deduct(FARE)
    @exit_station = exit_station
    journey = { entry_station => exit_station }
    @journeys << journey
    @entry_station = nil
  end

  private

  def too_high_balance_error
    raise "You can not have more than #{MAXIMUM_BALANCE} on your card"
  end

  def balance_too_high(top_up_amount)
    @balance + top_up_amount > MAXIMUM_BALANCE
  end

  def too_low_balance_error
    raise "You can not travel with less than £1"
  end

  def balance_too_low?
    @balance < MINIMUM_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end
end
