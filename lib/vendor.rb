class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    return 0 if @inventory[item].nil?
    @inventory[item]
  end

  def stock(item, quantity)
    @inventory[item] = 0 if @inventory[item].nil?
    @inventory[item] += quantity
  end

  def potential_revenue
    @inventory.map do |item, quantity|
      require "pry"; binding.pry
      item.price * quantity
    end
  end
end