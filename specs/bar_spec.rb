require_relative('../bar')
require('minitest/autorun')
require('minitest/rg')
require_relative('../drink')

class BarClassTest < MiniTest::Test

  def setup
    @drink1 = Drink.new("Vodka", 10, 10)
    @drink2 = Drink.new("OJ", 0, 10)

    @bar1 = Bar.new([{ name: "Vodka", quantity: 10}, { name: "OJ", quantity: 20}])

    @room1 = Room.new("In-bee Room", 10, 8)
    @room2 = Room.new("Wax Cylinder Room", 5, 3 )
    @room3 = Room.new("B-Pop Room", 100, 2)

    @venue1 = Venue.new("All in the Stinger", 1000, [@room1, @room2, @room3])
  end

  def test_attributes_bar
    assert_equal([{ name: "Vodka", quantity: 10}, { name: "OJ", quantity: 20}], @bar1.stock)
  end

  # def test_identify_drink
  #   result = @bar1.identify_drink("Vodka")
  #   assert_equal({ name: "Vodka", quantity: 10}, result)
  # end

  def test_identify_drink__index
    result = @bar1.identify_drink("Vodka")
    assert_equal(0, result)
  end

  def test_sell_drink
    @bar1.sell_drink("OJ")
    assert_equal(19, @bar1.stock[1][:quantity])
  end

  # def test_room_can_sell_via_superclass
  #   @room1.sell_drink("Vodka")
  #   result =
  #   assert_equal(19, result)
  # end
end
