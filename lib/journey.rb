<<<<<<< HEAD
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
=======
require_relative "./oystercard.rb"

class Journey
  PENALTY_FARE = 6

  attr_reader :entry_station

  def initialize(entry_station)
    @entry_station = entry_station
  end

  # def entry_station
  # end

  def fare
    unless @complete == true
      PENALTY_FARE
    else
      return 1
    end
  end

  def finish(exit_station)
    @complete = true
    return self
  end

  def complete?
    @complete = false
  end
end
>>>>>>> 18688ea5cf08a5a4c875295b6bc67313f6a32dfd
