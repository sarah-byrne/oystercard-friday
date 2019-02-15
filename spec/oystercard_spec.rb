require 'oystercard'


describe Oystercard do
  let (:entry_station ) {double :entry_station}
  let (:exit_station) {double()}
  it "balance is zero" do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it 'raises an error if max balance is exceeded' do
      max_balance = Oystercard::MAX_BALANCE
      subject.top_up(max_balance)
      expect{ subject.top_up 1 }.to raise_error "Max balance of #{Oystercard::MAX_BALANCE} exceeded"
    end
  end

    describe '#journey' do
      before(:each) do
        subject.top_up(2)
      end

      it 'can touch in' do
        journey_double = double :journey
        journey_log_double = double :journey_log
        card = Oystercard.new(journey_log_double)
        card.top_up(2)
        allow(journey_log_double).to receive(:start)
        card.touch_in(entry_station)
      end

    end
    it "should not allow to touch in when less than £1 is in the card" do
      subject.top_up(0.1)

      expect {subject.touch_in}.to raise_error("The money is not enough in card.")
    end

    it "should deduct journey fare from balance after touch out" do
      journey_double = double :journey, finish: {}, fare: 1
      journey_log_double = double :journey_log, last: journey_double, finish: {}, start: {}
      card = Oystercard.new(journey_log_double)
      card.top_up(2)
      card.touch_in(entry_station)
      expect{card.touch_out(exit_station) }.to change{ card.balance}.by -1
    end

    it "gets created with a new journey log" do
      journey_double = double :journey
      journey_log_double = double :journey_log
      card = Oystercard.new(journey_log_double)
      expect(card.journey_log).to eq(journey_log_double)
    end



end
