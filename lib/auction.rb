class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    names = []
    @items.each do |item|
    names << item.name
    end
    names
  end

  def unpopular_items

    items.find_all do |item|
      item.bids.count == 0
      # require "pry"; binding.pry
    end
  end

  def potential_revenue
    total = 0
      @items.each do |item|
      total += item.bids.values.max.to_i
      end
    total
  end
end
