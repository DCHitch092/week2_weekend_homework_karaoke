class Song

  attr_reader :artist, :title, :num_of_plays

  def initialize(artist, title, num_of_plays)
    @artist = artist
    @title = title
    @num_of_plays = num_of_plays
  end

  def increase_plays
    @num_of_plays += 1
  end
end
