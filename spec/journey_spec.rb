require 'journey'

describe Journey do
  let (:oystercard) {double(Oystercard.new, :balance => 10)}

  it 'returns if the journey has started' do
    journey = Journey.new
    expect(journey.start).to eq true
  end
  it "returns the journey is complete" do
    journey = Journey.new
    expect(journey.finished).to eq true
  end
end
