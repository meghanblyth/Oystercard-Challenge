require_relative './oystercard.rb'
require_relative './station.rb'

class Journey 
  
  attr_accessor :journeys_list
  
  def initialize
    @journeys_list = [] 
  end

  def in_journey?
    !!entry_station 
  end 

  def save_journey 
    @journeys_list << { start: @entry_station, end: @exit_station }
  end
end