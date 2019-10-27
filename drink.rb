class Drink

  attr_reader :name, :level, :price, :quantity

  def initialize (name, level, price, quantity)
    @name = name
    @level = level
    @price = price
    @quantity = quantity
  end

  def remove_unit
    @quantity -= 1
  end

end
