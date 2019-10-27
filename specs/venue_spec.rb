require('minitest/autorun')
require('minitest/rg')
require_relative('../venue')
require_relative('../song')
require_relative('../room')
require_relative('../guest')
require_relative('../drink')

class VenueClassTest < MiniTest::Test

  def setup
    @room1 = Room.new("In-bee Room", 10, 8)
    @room2 = Room.new("Wax Cylinder Room", 5, 3 )
    @room3 = Room.new("B-Pop Room", 100, 2)

    @drink1 = Drink.new("Vodka", 10, 10, 10)
    @drink2 = Drink.new("OJ", 0, 10, 20)

    @venue1 = Venue.new("All in the Stinger", 1000, [@room1, @room2, @room3], [@drink1, @drink2])

    @guest1 = Guest.new("Queen Mary", 100, "Let it Bee")
    @guest2 = Guest.new("Timothbee", 100, "Honey Honey Honey")
    @guest3 = Guest.new("Beetrice", 90, "Are you gonna BEE my girl?")
    @guest4 = Guest.new("Barbee", 0, "Let it Bee")

    @song1 = Song.new("The Bee-tles", "Let it Bee")
    @song2 = Song.new("The Bees' Geez", "Saturday Hive Fever")
    @song3 = Song.new("The Hives", "Are you gonna BEE my girl?")
    @song4 = Song.new("AayBeeBeeAay", "Honey Honey Honey")

  end

  def test_venue_attributes
    #test name
    assert_equal("All in the Stinger", @venue1.name)
    #test till
    assert_equal(1000, @venue1.till)
    #test rooms
    assert_equal([@room1, @room2, @room3], @venue1.rooms)
    assert_equal([@drink1, @drink2], @venue1.stock)
  end

  def test_create_room
    @venue1.create_room("Holy Wasp Zone", 100, 4)
    assert_equal(4, @venue1.rooms.length())
  end

  def test_check_in_guest
    @venue1.check_in_guest(@guest1, @room1)
    assert_equal(1, @room1.guests.length())
  end

  def test_check_in_guests__room
    @room1.add_guest(@guest2)
    @room1.add_guest(@guest3)
    @venue1.check_in_guest(@guest1, @room1)
    assert_equal([@guest2, @guest3, @guest1], @room1.guests)
  end

  def test_check_in_guests__full
    @room3.add_guest(@guest2)
    @room3.add_guest(@guest3)
    @venue1.check_in_guest(@guest4, @room3)
    assert_equal([@guest2, @guest3], @room3.guests)
  end

  def test_check_out_guests
    @room3.add_guest(@guest2)
    @room3.add_guest(@guest3)
    @venue1.check_out_guest(@guest2, @room3)
    assert_equal([@guest3], @room3.guests)
  end

  def test_add_funds
    @venue1.add_funds(10)
    assert_equal(1010, @venue1.till)
  end

  def test_take_payment
    @venue1.take_payment(@guest1, @room1)
    assert_equal(1010, @venue1.till )
    assert_equal(90, @guest1.wallet)
  end

  # def test_identify_drink_in_stock__index
  #   result = @venue1.identify_drink("Vodka")
  #   assert_equal(0, result)
  # end

  def test_find_drink_by_name
    result = @venue1.find_drink_by_name("Vodka")
    assert_equal(@drink1, result)
  end

  def test_sell_drink
    @venue1.sell_drink("OJ", @guest1)
    #guest pays money
    assert_equal(90, @guest1.wallet)
    #drink goes down
    assert_equal(19, @drink2.quantity)
    #till goes up
    assert_equal(1010, @venue1.till)

  end

end
