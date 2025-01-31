require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Item do
  it "exists and has attributes" do
    item1 = Item.new('Chalkware Piggy Bank')

    expect(item1).to be_a(Item)
    expect(item1.name).to eq('Chalkware Piggy Bank')
    expect(item1.bids).to eq({})
  end

  it "can add attendees' bids" do
    attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    item1 = Item.new('Chalkware Piggy Bank')

    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)

    expect(item1.bids).to eq({
      attendee2 => 20,
      attendee1 => 22
      })
  end

  it "has a current highest bid" do
    attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    item1 = Item.new('Chalkware Piggy Bank')

    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)

    expect(item1.current_high_bid).to eq(22)
  end
end
