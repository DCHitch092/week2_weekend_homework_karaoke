class Guest

attr_reader :name, :wallet, :favourite_song

  def initialize (name, wallet, favourite_song)
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song
  end

  def woop
    "Wahoo! This is my favourite song!"
  end

  def make_payment(amount)
    @wallet -= amount
  end

  def playlist_check(room)
    return false if room.playlist == []
    for song in room.playlist
      if song.title == @favourite_song
      song.increase_plays()
      return woop()
      end
    end
  end




end
