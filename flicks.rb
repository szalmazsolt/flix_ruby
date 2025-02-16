class Movie
  attr_accessor :title
  attr_reader :rank

  def initialize(title:, rank: 0)
    @title = title.capitalize
    @rank = rank.to_i
  end

  def num_of_stars
    return @rank / 2 unless @rank == 0
    0
  end

  # endless methods
  def stars = '⭐️' * num_of_stars

  def thumbs_up = @rank += 1

  def thumbs_down = @rank -= 1

  def to_s
    "#{@title} has a rank of".ljust(30, '.') + "#{@rank.to_s.rjust(3, ' ')} (#{stars.empty? ? "No stars" : stars})"
  end
end

class Playlist
  def initialize(name)
    @name = name.capitalize
    @movies = []
  end

  def add_movie(movie)
    @movies << movie
  end

  def play
    puts "Playing #{@name}'s playlist:"
    puts @movies
    puts "Reviewing".center(30, '.')
    @movies.each do |movie|
      movie.thumbs_up
      puts movie
    end
  end
end

movie1 = Movie.new(title: "goonies", rank: 10)
movie2 = Movie.new(rank: 9, title: "ghostbusters")
movie3 = Movie.new(title: "goldfinger")

playlist1 = Playlist.new("Kermit")
playlist1.add_movie(movie1)
playlist1.add_movie(movie2)
playlist1.add_movie(movie3)
playlist1.play