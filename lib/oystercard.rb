class Oystercard
  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :journeys_list 
  attr_accessor :entry_station 

  def initialize
    @balance = 0
    # @entry_station = nil 
    @journeys_list = [] 
  end

  def top_up(amount)
    fail 'You have reached the maximum possible balance of 90' if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    !!entry_station 
  end 

  def touch_in(station)
    fail 'Insufficient funds to touch in, Please top up' if balance < MINIMUM_FARE
    @entry_station = station 
  end 

  def touch_out(exit_station) 
    deduct(MINIMUM_FARE)
    @exit_station = exit_station
    save_journey
    @entry_station = nil 
  end

  private
  
  def deduct(amount)
    @balance -= amount
  end

  def save_journey 
    @journeys_list << { start: @entry_station, end: @exit_station }
  end
end
