require('minitest/autorun')
require('minitest/rg')
require_relative('../song')

class SongClassTest < MiniTest::Test

  def setup
    @song1 = Song.new("The Bee-tles", "Let it Bee")
    @song2 = Song.new("The Bees' Geez", "Saturday Hive Fever")
    @song3 = Song.new("The Hives", "Are you gonna BEE my girl?")
    @song4 = Song.new("AayBeeBeeAay", "Honey Honey Honey")
  end

  def test_song_attributes
    #has artist
    assert_equal("The Bee-tles", @song1.artist)
    #has title
    assert_equal("Saturday Hive Fever", @song2.title)
    #has total number of play
    assert_equal(0, @song3.num_of_plays)
  end

  def test_increase_plays
    @song4.increase_plays
    result = @song4.num_of_plays
    assert_equal(1, result)
  end

end
