require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../song')
require_relative('../guest')

class RoomClassTest < MiniTest::Test

  def setup
    @room1 = Room.new("In-bee Room", 10, 8)
    @room2 = Room.new("Wax Cylinder Room", 5, 3 )
    @room3 = Room.new("B-Pop Room", 100, 2)

    @guest1 = Guest.new("Queen Mary", 100, "Let it Bee")
    @guest2 = Guest.new("Timothbee", 100, "Honey Honey Honey")
    @guest3 = Guest.new("Beetrice", 90, "Are you gonna BEE my girl?")
    @guest4 = Guest.new("Barbee", 0, "Let it Bee")

    @song1 = Song.new("The Bee-tles", "Let it Bee", 12)
    @song2 = Song.new("The Bees' Geez", "Saturday Hive Fever", 64)
    @song3 = Song.new("The Hives", "Are you gonna BEE my girl?", 30)
    @song4 = Song.new("AayBeeBeeAay", "Honey Honey Honey", 11)

    @room5 = Room.new("Karaoke Room 1", 10, 20)
  end

  def test_song_facts__room_5
    @room5.add_song(@song1)
    @room5.add_song(@song2)
    @room5.add_song(@song3)
    @room5.add_song(@song4)
    result = @room5.playlist_facts()
    #returns the total number of plays
    # assert_equal(117, result)
    #returns the name of the song sung most
    assert_equal("We have played over 117 songs, and the most popular song is Saturday Hive Fever by The Bees' Geez", result)

  end



  def test_room_has_attributes
    #check name
    assert_equal("Wax Cylinder Room", @room2.name)
    #check price
    assert_equal( 10, @room1.price)
    #check space
    assert_equal(2, @room3.space)
    #check playlist
    assert_equal([], @room2.playlist)
    #check guests
    assert_equal([], @room1.guests)
  end

  def test_add_guests
    @room1.add_guest(@guest1)
    assert_equal([@guest1], @room1.guests)
  end

  def test_remove_guests
    @room2.add_guest(@guest2)
    @room2.add_guest(@guest3)
    @room2.remove_guest(@guest2)
    assert_equal([@guest3], @room2.guests)
  end

  def test_check_space__true
    @room1.add_guest(@guest2)
    @room1.add_guest(@guest3)
    result = @room1.check_space?
    assert_equal(true, result)
  end

  def test_check_space__full
    @room3.add_guest(@guest2)
    @room3.add_guest(@guest3)
    result = @room3.check_space?
    assert_equal(false, result)
  end

  # def test_check_in_guests__room
  #   @room1.add_guest(@guest2)
  #   @room1.add_guest(@guest3)
  #   @room1.check_in(@guest1)
  #   assert_equal([@guest2, @guest3, @guest1], @room1.guests)
  # end
  #
  # def test_check_in_guests__full
  #   @room3.add_guest(@guest2)
  #   @room3.add_guest(@guest3)
  #   @room3.check_in(@guest4)
  #   assert_equal([@guest2, @guest3], @room3.guests)
  # end

  def test_check_funds__enough
    result = @room3.check_funds?(@guest1)
    assert_equal(true, result)
  end

  def test_check_funds__not_enough
    result = @room3.check_funds?(@guest3)
    assert_equal(false, result)
  end

  def test_add_song
    @room1.add_song(@song3)
    assert_equal([@song3], @room1.playlist)
  end

end
