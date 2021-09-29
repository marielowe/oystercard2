require "./lib/oystercard.rb"

describe Oyster_card do
  let(:maximum_balance) {Oyster_card::MAXIMUM_BALANCE}
  let(:minimum_charge) {Oyster_card::MINIMUM_CHARGE}
  let(:entry_station_double) {double :station}
  let(:exit_station_double) { double :station}
 
  
  it 'checks the balance is zero at initialisation' do
    
    expect(subject.balance).to eq 0
  end

  describe '.top_up' do
    before do
      subject.top_up(10)
    end
    it 'tops up account by £10' do
      subject.top_up(10)
      expect(subject.balance).to eq 20
    end
   
    it 'raise error if balance exceeds £20' do
    # p  subject.top_up(20)
      expect {subject.top_up(11)}.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end
  end

  # it 'deducts £15 from account' do
  #   subject.top_up(maximum_balance)
  #   subject.deduct(15)
  #   expect(subject.balance).to eq 75
  # end

  describe '.touch_in' do
    it 'sets card as in use' do
      subject.top_up(10)
      expect(subject.touch_in(entry_station_double)).to eq true
    end

    it 'checks if card is in_journey?' do
      subject.top_up(10)
      subject.touch_in(entry_station_double)
      expect(subject.in_journey?).to eq true
    end

    it 'returns error if balance < minimum_charge' do
      expect {subject.touch_in(entry_station_double)}.to raise_error "Insufficient funds"
    end
  end
  

  describe '.touch_out' do
    it 'set card as not in use' do 
      subject.top_up(10)
      subject.touch_in(entry_station_double)
      subject.touch_out(exit_station_double)
      expect(subject.in_journey?).to eq false
    
    end

    it 'reduces balance by min amount £1' do
      subject.top_up(10)
      subject.touch_in(entry_station_double)
      expect {subject.touch_out(exit_station_double)}.to change{subject.balance}.by(- minimum_charge)
    end
  end
end