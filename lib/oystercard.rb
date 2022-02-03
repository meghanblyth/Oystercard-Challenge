require_relative './station.rb'
require_relative './journey.rb'

class Oystercard
  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

<<<<<<< HEAD
  attr_reader :balance, :journeys_list, :exit_station 
=======
  attr_reader :balance, :journeys_list
>>>>>>> 18688ea5cf08a5a4c875295b6bc67313f6a32dfd
  attr_accessor :entry_station

  def initialize
    @balance = 0
<<<<<<< HEAD
    # @entry_station = nil 
    # @journeys_list = [] 
=======
    # @entry_station = nil
    @journeys_list = []
>>>>>>> 18688ea5cf08a5a4c875295b6bc67313f6a32dfd
  end

  def top_up(amount)
    fail 'You have reached the maximum possible balance of 90' if amount + balance > MAXIMUM_BALANCE

    @balance += amount
  end

<<<<<<< HEAD
  # def in_journey?
  #   !!entry_station 
  # end 
=======
  def in_journey?
    !!entry_station
  end
>>>>>>> 18688ea5cf08a5a4c875295b6bc67313f6a32dfd

  def touch_in(station)
    fail 'Insufficient funds to touch in, Please top up' if balance < MINIMUM_FARE

    @entry_station = station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @exit_station = exit_station
<<<<<<< HEAD
    Journey.new.save_journey
    @entry_station = nil 
=======
    save_journey
    @entry_station = nil
>>>>>>> 18688ea5cf08a5a4c875295b6bc67313f6a32dfd
  end

  private

  def deduct(amount)
    @balance -= amount
  end

<<<<<<< HEAD
  # def save_journey 
  #   @journeys_list << { start: @entry_station, end: @exit_station }
  # end
=======
  def save_journey
    @journeys_list << { start: @entry_station, end: @exit_station }
  end
>>>>>>> 18688ea5cf08a5a4c875295b6bc67313f6a32dfd
end
