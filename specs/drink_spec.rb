require('minitest/autorun')
require('minitest/rg')
require_relative('../drink')

class DrinkClassTest < MiniTest::Test

  def setup
    @drink1 = Drink.new("Vodka", 10, 10, 10)
    @drink2 = Drink.new("OJ", 0, 10, 20)
  end

  def test_drink_attributes
    #check name
    assert_equal("Vodka", @drink1.name)
    #check if alcoholic
    # assert_equal(true, @drink1.alcohol)
    # #check alcohol level
    assert_equal(10, @drink1.level)
    #check price
    assert_equal(10, @drink1.price)
    #check quantity
    assert_equal(10, @drink1.quantity)
  end

  def remove_unit
    @drink1.remove_unit
    result (9, @drink1.quantity)
  end
end
