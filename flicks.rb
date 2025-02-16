class Movie
  attr_accessor :title
  attr_reader :rank

  def initialize(title, rank=0)
    @title = title.capitalize
    @rank = rank.to_i
  end

  def num_of_stars
    return @rank / 2 unless @rank == 0
    0
  end

  def stars
    '*' * num_of_stars
  end

  def thumbs_up
    @rank += 1
  end

  def thumbs_down
    @rank -= 1
  end

  def to_s
    "#{@title} has a rank of".ljust(30, '.') + "#{@rank.to_s.rjust(3, ' ')} (#{stars.empty? ? "No stars" : stars})"
  end
end

class Playlist
  
end

movie1 = Movie.new("goonies", 10)
movie2 = Movie.new("ghostbusters", 9)
movie3 = Movie.new("goldfinger")

playlist1 = Playlist.new("Kermit")
playlist1.add_movie(movie1)
playlist1.add_movie(movie2)
playlist1.add_movie(movie3)
playlist1.play