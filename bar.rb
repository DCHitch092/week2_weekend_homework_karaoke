class Bar

  attr_reader :stock

  def initialize(stock)
    @stock = stock
  end

  def identify_drink(drink_name)
    found_drink =  nil
    for drink in @stock
      found_drink = drink if drink[:name] == drink_name
    end
    # return found_drink
    return @stock.index(found_drink)

  end

  def sell_drink(drink_name)
    found_index = identify_drink(drink_name)
    @stock[found_index][:quantity] -= 1

  end

end
