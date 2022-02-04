require_relative '../lib/oystercard.rb'

describe Oystercard do
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:journey) { { :entry_station => "entry_station", :exit_station => "exit_station" } }

  describe 'default for card on initialize' do
    it 'should have an opening balance of 0' do
      expect(subject.balance).to eq Oystercard::DEFAULT_BALANCE
    end

  end
  
  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect { subject.top_up 1 }.to change { subject.balance }.by 1
    end

    it 'raises an error if the maximum balance is reached' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up maximum_balance
      expect { subject.top_up 1 }.to raise_error "You have reached the maximum possible balance of #{maximum_balance}"
    end
  end

  describe '#touch_in' do
  
    it "deducts the minumum far upon touch out" do
      expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-Oystercard::MINIMUM_FARE)
    end 

    it 'saves the entry and exit station' do
      subject.top_up(5)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to eq [journey]
    end

    it "creates multiple journeys" do
      subject.top_up(10) 
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect( subject.journeys).to eq [journey,journey]
    end
  end
end