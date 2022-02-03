class Oystercard
  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance 
  attr_accessor :entry_station 

  def initialize
    @balance = 0
    @entry_station = nil 
  end

  def top_up(amount)
    fail 'You have reached the maximum possible balance of 90' if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    # return @entry_station == nil ? false : true 

    !!entry_station 

    # if entry_station == true 
    #   return true 
    # else 
    #   return false 
    # end 
  end 

  def touch_in(station)
    fail 'Insufficient funds to touch in, Please top up' if balance < MINIMUM_FARE
    @entry_station = station 
  end 

  def touch_out
    deduct(MINIMUM_FARE)
   @entry_station = nil 
  end

  private
  
  def deduct(amount)
    @balance -= amount
  end
end
