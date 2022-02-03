require_relative '../lib/journey.rb'
require_relative '../lib/oystercard.rb'

describe Journey do 

  let(:oystercard) { double :oystercard }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:journey) { { start: entry_station, end: exit_station } } 

  describe 'on initialize' do 

    it 'should have an empty list of journeys' do
      expect(subject.journeys_list).to be_empty
    end

  end

  describe '#save_journey' do 

    it 'saves the journey' do
      allow(oystercard).to receive(:top_up).and_return(5) 
      allow(oystercard).to receive(:touch_in)
      allow(oystercard).to receive(:touch_out)
      oystercard.top_up(5)
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station) 
      expect(subject.journeys_list).to include(journey) 
    end 
  end
end