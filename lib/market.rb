class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor) 
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.select do |vendor|
      vendor.inventory.keys.include?(item)
    end
  end

  def total_inventory
    total_inventory = Hash.new(0)
    # require "pry"; binding.pry
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        total_inventory[item] += quantity.to_i
      end
    end
    total_inventory
  end

  def sorted_item_list
    total_inventory.keys.map do |item|
      item.name
    end.sort.uniq
  end

  def overstocked_items
    total_inventory.select do |item, quantity|
      if quantity > 50 && vendors_that_sell(item).length > 1
        item
      end
    end
  end
end