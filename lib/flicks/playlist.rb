require_relative 'reviewer'

class Playlist
  # puts self
  def initialize(name)
    @name = name.capitalize
    @movies = []
  end

  def add_movie(movie)
    @movies << movie
  end

  def play(viewings)
    # puts self.inspect
    puts "Playing #{@name}'s playlist."
    puts "\nBefore viewing:"
    puts @movies
    puts
    1.upto(viewings) do |viewing|
      puts "\n#{viewing}. viewing:"
      @movies.each do |movie|
        Reviewer.review(movie)
      end
    end
    puts "\nAfter viewing:"
    puts @movies
  end

  def print_stats
    hits, flops = @movies.partition {|m| m.hit?}
    puts
    puts "Stats".center(20, '.')
    puts "Hits:"
    puts hits
    puts "Flops:"
    puts flops
    puts
    puts 'Movie Rankings:'
    puts @movies.sort_by {|m| m.rank}.reverse
  end
end