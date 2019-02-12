require 'oystercard'

describe Oystercard do
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
      expect{ subject.top_up 1 }.to raise_error 'Max balance of #{max_balance} exceeded'
    end
  end

    # describe '#deduct' do
    #   it { is_expected.to respond_to(:deduct).with(1).argument }
    #
    # #   it 'deducts an amount from the balance' do
    # #     subject.top_up(20)
    # #     expect{ subject.deduct 3}.to change{ subject.balance }.by -3
    # #   end
    # end

    describe '#journey' do
      before(:each) do
        subject.top_up(2)
      end
      it 'is not in a journey' do
        expect(subject.be_in_journey).to eq false
      end

      it 'can touch in' do
        subject.touch_in
        expect(subject.be_in_journey).to eq true
      end

      it 'can touch out' do
        subject.touch_in
        subject.touch_out
        expect(subject.be_in_journey).to eq false
      end
    end
    it "should not allow to touch in when less than £1 is in the card" do
      subject.top_up(0.1)

      expect {subject.touch_in}.to raise_error("The money is not enough in card.")
    end

    it "should deduct minimum fare from balance after touch out" do
      subject.top_up(2)
      expect{subject.touch_out }.to change{ subject.balance}.by -1
    end


end
