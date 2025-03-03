require_relative 'reviewer'
require_relative 'snackbar'

class Playlist
  # puts self
  
  # A Date structure defines a class whose attributes unlike Struct attributes cannot be modified
  Snack = Data.define(:name, :carbs)

  # Constants in Ruby are all upper-cased, except for class names
  SNACKS = [
    Snack.new(:popcorn, 15),
    Snack.new(:soda, 5),
    Snack.new(:nachos, 20),
    Snack.new(:candy, 10),
  ]

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
    # snacks = SnackBar::SNACKS
    puts "There are #{SNACKS.size} snacks available"
    1.upto(viewings) do |viewing|
      puts "\n#{viewing}. viewing:"
      @movies.each do |movie|
        Reviewer.review(movie)
        # snack = SnackBar.get_random
        snack = SNACKS.sample
        puts "Reviewing #{movie.title} has led to the consumption of #{snack.carbs} carbs of #{snack.name}"
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