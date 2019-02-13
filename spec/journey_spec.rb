require 'journey'

describe Journey do
  let (:oystercard) {double("Oystercard", :balance => 10)}
  let (:starting_station) {double("Station", :name => "Oxford Station", :zone => 1)}

  it 'starts when created' do
    journey = Journey.new(starting_station)
    expect(journey.state).to eq "started"
  end

  it 'gets created with a starting station if passed in' do
    journey = Journey.new(starting_station)
    expect(journey.starting_station).to equal starting_station
  end


  it 'finishes when instructed to finish' do
    journey = Journey.new(starting_station)
    journey.finish(starting_station)
    expect(journey.state).to eq "finished"
  end

  it 'sets the ending station to the input station when instructed to finish' do
    journey = Journey.new(starting_station)
    journey.finish(starting_station)
    expect(journey.ending_station).to equal starting_station
  end

  it 'sets the ending station to nil if exit ending station not passed in when instructed to finish' do
    journey = Journey.new(starting_station)
    journey.finish
    expect(journey.ending_station).to equal nil
  end

  it 'gets created with a nil starting station if not passed in' do
    journey = Journey.new
    expect(journey.starting_station).to equal nil
  end

  it 'indicates if it is not complete' do
    journey = Journey.new(starting_station)
    expect(journey.complete?).to eq false
  end

  it 'returns the right fare for itself' do
    journey = Journey.new(starting_station)
    journey.finish(starting_station)
    expect(journey.fare).to eq 1
  end

  it 'returns penalty fare of 6 for itself if entry station is not passed' do
    journey = Journey.new
    journey.finish(starting_station)
    expect(journey.fare).to eq 6
  end

  it 'returns penalty fare of 6 for itself if exit station is not passed' do
    journey = Journey.new(starting_station)
    journey.finish
    expect(journey.fare).to eq 6
  end
end
