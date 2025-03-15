require_relative 'reviewer'
require_relative 'snackbar'

class Playlist
  # puts self

  def initialize(name)
    @name = name.capitalize
    @movies = []
  end

  def load(from_file)
    File.open(from_file) do |file|
      file.readlines.each do |line|
        add_movie(Movie.from_csv(line))
      end
    end
  end

  def save(to_file="movie_rankings.csv")
    File.open(to_file, 'w') do |file|
      sorted_movies.each do |movie|
        file.puts movie.to_csv        
      end  
    end
  end

  def add_movie(movie)
    @movies << movie
  end

  def sorted_movies
    @movies.sort_by { |movie| movie.rank }.reverse
  end

  def play(viewings)
    # puts self.inspect
    puts "Playing #{@name}'s playlist."
    puts "\nBefore viewing:"
    puts @movies
    puts
    # snacks = SnackBar::SNACKS
    # puts "There are #{snacks.size} snacks available"
    puts "Choose from the snackbar:"
    puts SnackBar.menu_items
    1.upto(viewings) do |viewing|
      puts "\n#{viewing}. viewing:"
      @movies.each do |movie|
        Reviewer.review(movie)
        snack = SnackBar.get_random
        movie.consumed_snack(snack)
      end
    end
    puts "\nAfter viewing:"
    puts sorted_movies
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
    puts sorted_movies
  end
end