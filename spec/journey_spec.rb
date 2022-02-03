<<<<<<< HEAD
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
=======
require 'journey'

describe Journey do
  subject { described_class.new(station) }
  let(:station) { double :station, zone: 1 }

  it 'knows if a journey is not complete' do
    expect(subject).not_to be_complete
  end

  it 'has a penalty fare by default' do
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end

  it 'returns itself when exiting a journey' do
    expect(subject.finish(station)).to eq(subject)
  end

  context 'given an entry station' do
    it 'has a entry station' do
      expect(subject.entry_station).to eq station
    end

    it 'returns a penatly fair if not exit station given' do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    context 'given an exit station' do
      let(:other_station) { double :other_station }

      before do
        subject.finish(other_station)
      end

      it 'calculates a fare' do
        expect(subject.fare).to eq 1
      end
    end
  end
end
>>>>>>> 18688ea5cf08a5a4c875295b6bc67313f6a32dfd
