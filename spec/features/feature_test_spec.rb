require 'oystercard'

describe 'oystercard system' do
# In order to use public transport
# As a customer
# I want money on my card
  it "start with 0 balance" do
    card = Oystercard.new
    expect(card.balance).to eq(0)
  end

# In order to keep using public transport
# As a customer
# I want to add money to my card
  it "can top up by £50" do
    card = Oystercard.new
    card.top_up(50)
    expect(card.balance).to eq(50)
  end

#
# In order to protect my money
# As a customer
# I don't want to put too much money on my card
  it "can limit balance" do
    card = Oystercard.new
    card.top_up(Oystercard::MAX_BALANCE)
    expect { card.top_up(1) }.to raise_error("Max balance of #{Oystercard::MAX_BALANCE} exceeded")
  end
#
# In order to pay for my journey
# As a customer
# I need my fare deducted from my card
#
# In order to get through the barriers
# As a customer
# I need to touch in and out
#
# In order to pay for my journey
# As a customer
# I need to pay for my journey when it's complete
#
# In order to pay for my journey
# As a customer
# I need to know where I've travelled from
  it "can limit deduct fare from balance" do
    card = Oystercard.new
    card.top_up(Oystercard::MAX_BALANCE)
    card.touch_in("Paddington")
    card.touch_out("Kings Cross")
    expect(card.balance).to eq(Oystercard::MAX_BALANCE - Journey::MIN_FARE)
  end
#
# In order to pay for my journey
# As a customer
# I need to have the minimum amount for a single journey
it "can check there is enough balance" do
  card = Oystercard.new
  expect { card.touch_in("Paddington") }.to raise_error("The money is not enough in card.")
end
#
# In order to know where I have been
# As a customer
# I want to see to all my previous trips
it "can show all previous trips" do
  card = Oystercard.new
  card.top_up(50)
  card.touch_in("Paddington")
  card.touch_out("Kings Cross")
  card.touch_in("Farringdon")
  card.touch_out("Liverpool St")
  expect(card.show_journeys).to be_a Array
end
#
# In order to know how far I have travelled
# As a customer
# I want to know what zone a station is in
#
# In order to be charged correctly
# As a customer
# I need a penalty charge deducted if I fail to touch in or out
#
# In order to be charged the correct amount
# As a customer
# I need to have the correct fare calculated
end
