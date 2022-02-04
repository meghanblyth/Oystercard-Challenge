require_relative "./oystercard.rb"

class Journey
  PENALTY_FARE = 6

  attr_reader :entry_station

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
  end

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
