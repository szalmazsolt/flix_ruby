require_relative 'reviewer'
require_relative 'snackbar'

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
    snacks = SnackBar::SNACKS
    puts "There are #{snacks.size} snacks available"
    1.upto(viewings) do |viewing|
      puts "\n#{viewing}. viewing:"
      @movies.each do |movie|
        Reviewer.review(movie)
        snack = SnackBar.get_random
        movie.consumed_snack(snack)
      end
    end
    puts "\nAfter viewing:"
    puts @movies
    puts
  end

  def print_stats
    print "Grand total carbs consumed by #{@name}: "
    grand_total_carbs = 0
    @movies.each do |movie|
      grand_total_carbs += movie.total_carbs_per_movie
    end
    puts grand_total_carbs
    @movies.each do |movie|
      puts "For #{movie.title}:"
      movie.each_snack do |snack|
        puts "#{snack.name.capitalize} with #{snack.carbs} carbs was consumed"
      end
      print "The total carbs consumed: "
      puts movie.total_carbs_per_movie
      puts
    end
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