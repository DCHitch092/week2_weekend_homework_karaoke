class Room

  attr_reader :name, :price, :space, :playlist, :guests

  def initialize(name, price, space)
    @name = name
    @price = price
    @space = space
    @playlist = []
    @guests = []
  end

  def add_guest(guest)
    @guests.push(guest)
  end

  def remove_guest(guest)
    @guests.delete(guest)
  end

  def check_space?
    return true if (@space - @guests.length) > 0
    return false
  end

  def check_funds?(guest)
    return true if guest.wallet - @price >= 0
    return false
  end

  # def check_in(guest)
  #   #check if customer has enough money
  #   return "insufficient funds" if check_funds?(guest) == false
  #   #check if full
  #   return "there is no room" if check_space?() == false
  #   add_guest(guest)
  # end

  def add_song(song)
    @playlist.push(song)
  end

  def playlist_facts
    total_result = 0
    for song in @playlist
      total_result += song.num_of_plays
    end
      most_popular = @playlist.max_by{|song| song.num_of_plays}



  p "We have played over #{total_result} songs, and the most popular song is #{most_popular.title} by #{most_popular.artist}"
  end

end
