class Movie
  attr_accessor :title
  attr_reader :rank

  def initialize(title:, rank: 0)
    @title = title.capitalize
    @rank = rank.to_i
  end

  def num_of_stars
    return @rank / 2 unless @rank <= 0
    0
  end

  # endless methods
  def stars = '⭐️' * num_of_stars

  def hit? = @rank >= 10

  def status 
    hit? ? 'Hit' : 'Flop'
  end

  def thumbs_up = @rank += 1

  def thumbs_down
    # puts self.inspect
    @rank -= 1 if @rank > 0
  end

  def to_s
    "#{@title} has a rank of".ljust(30, '.') + "#{@rank.to_s.rjust(3, ' ')}, it's a #{status} (#{stars.empty? ? "No stars" : stars})"
  end
end

if __FILE__ == $0
  movie = Movie.new(title: "goonies", rank: 10)
  puts movie
  movie.thumbs_up
  puts movie.rank
end