require_relative './station.rb'
require_relative './journey.rb'

class Oystercard
  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :entry_station, :current_journey, :journeys


  def initialize(journey_class = Journey, balance = DEFAULT_BALANCE)
    @balance = balance
    @entry_station = nil 
    @journeys = []
    @journey_class = journey_class
    @current_journey = journey_class.new
  end

  def top_up(amount)
    fail 'You have reached the maximum possible balance of 90' if amount + balance > MAXIMUM_BALANCE

    @balance += amount
  end

  def touch_in(entry_station)
    fail 'Insufficient funds to touch in, Please top up' if balance < MINIMUM_FARE
    @current_journey = @journey_class.new(entry_station)
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @current_journey.exit_station = exit_station
    add_journey(exit_station)
    @current_journey = @journey_class.new

  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def add_journey
    journeys << @current_journey
  end
end
