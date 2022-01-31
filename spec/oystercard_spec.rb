require_relative '../lib/oystercard.rb' 

describe Oystercard do
  it 'should have an opening balance of 0' do
    expect(subject.balance).to eq Oystercard::DEFAULT_BALANCE
  end
end
