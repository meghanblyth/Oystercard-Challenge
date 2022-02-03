require_relative '../lib/oystercard.rb' 
require_relative '../lib/journey.rb'

describe Oystercard do

  let(:station){ double :station }
  let(:exit_station) { double :station } 
  let(:journey) { { start: station, end: exit_station } } 
  
  describe 'default for card on initialize' do
    it 'should have an opening balance of 0' do
      expect(subject.balance).to eq Oystercard::DEFAULT_BALANCE
    end

    # it 'should have an empty list of journeys' do
    #   expect(subject.journeys_list).to be_empty
    # end
  end
  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect { subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it 'raises an error if the maximum balance is reached' do 
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up maximum_balance
      expect { subject.top_up 1 }.to raise_error "You have reached the maximum possible balance of #{maximum_balance}"
    end 
  end

  # describe '#deduct' do
  #   it { is_expected.to respond_to(:deduct).with(1).argument }

  #   it 'can deduct from the balance' do
  #     expect { subject.deduct 1}.to change{ subject.balance }.by -1
  #   end
  # end

  describe '#in_journey?' do #testing the method, not the attribute - using a ? 
    xit 'is initially not in journey' do #Add an x to pend
      expect(subject).not_to be_in_journey #testing the instance variable "in journey" - still passes because it's NOT in journey, although it can no longer read the instance variable 
    end
  end

  describe '#touch_in' do
    xit 'can touch in' do
      subject.top_up(5)
      subject.touch_in(station) 
      expect(subject).to be_in_journey
    end

    it 'stores the entry station' do 
      subject.top_up(5)
      subject.touch_in(station)  
      expect(subject.entry_station).to eq station 
    end 

    it 'Will not touch_in if it is below the minimum balance' do
      expect { subject.touch_in(station) }.to raise_error "Insufficient funds to touch in, Please top up"
    end
  end

  describe '#touch_out' do
    it 'can touch out' do
      subject.top_up(Oystercard::MINIMUM_FARE)
      subject.touch_in(station)
      expect { subject.touch_out(exit_station) }.to change{ subject.balance }.by(-Oystercard::MINIMUM_FARE)
    end

    # it 'saves the journey' do 
    #   subject.top_up(5)
    #   subject.touch_in(station)
    #   subject.touch_out(exit_station) 
    #   expect(subject.journeys_list).to include(journey) 
    # end 
  #     subject.touch_in 
  #     subject.touch_out 
  #     expect(subject).not_to be_in_journey
  #  end 
  end
end


