require_relative('../guest')
require('minitest/autorun')
require('minitest/rg')
require_relative('../song')
require_relative('../room')

class GuestClassTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Queen Mary", 100, "Let it Bee")
    @guest2 = Guest.new("Timothbee", 100, "Honey Honey Honey")
    @guest3 = Guest.new("Beetrice", 90, "Are you gonna BEE my girl?")
    @guest4 = Guest.new("Barbee", 0, "Let it Bee")

    @room1 = Room.new("In-bee Room", 10, 8)
    @room2 = Room.new("Wax Cylinder Room", 5, 3 )
    @room3 = Room.new("B-Pop Room", 100, 2)

    @song1 = Song.new("The Bee-tles", "Let it Bee")
    @song2 = Song.new("The Bees' Geez", "Saturday Hive Fever")
    @song3 = Song.new("The Hives", "Are you gonna BEE my girl?")
    @song4 = Song.new("AayBeeBeeAay", "Honey Honey Honey")

  end

  def test_guest_attributes
    #has name,
    assert_equal("Queen Mary", @guest1.name)
    #has wallet
    assert_equal(100, @guest2.wallet)
    #has favourite song
    assert_equal("Let it Bee", @guest4.favourite_song)
  end

  def test_woop
    assert_equal("Wahoo! This is my favourite song!", @guest1.woop)
  end

  def test_make_payment
    @guest1.make_payment(10)
    assert_equal(90, @guest1.wallet)
  end

  def test_room_playlist_check
    @room1.add_song(@song1)
    result = @guest1.playlist_check(@room1)
    assert_equal("Wahoo! This is my favourite song!", result )
    assert_equal(1, @song1.num_of_plays)
  end

end
