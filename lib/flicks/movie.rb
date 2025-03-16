require_relative "snackbar"
require_relative "rankable"

class Movie
  include Rankable

  attr_accessor :title, :rank

  def self.from_csv(line)
    title, rank = line.chomp.split(",")
    self.new(title: title, rank: Integer(rank))
  rescue ArgumentError => e
    puts "Sorry, but #{rank} is not an integer!"
    puts e.message
    puts "Setting rank of #{title} to 5..."
    self.new(title: title, rank: 5)
    # exit 1
  end

  def initialize(title:, rank: 0)
    @title = title.capitalize
    @rank = rank.to_i
    @snack_carbs = Hash.new(0)
  end

  def consumed_snack(snack)
    @snack_carbs[snack.name] += snack.carbs
    puts "While watching #{@title} you ate #{snack.carbs} carbs of #{snack.name}"
  end

  def each_snack
    @snack_carbs.each do |name, carbs|
      snack = SnackBar::Snack.new(name, carbs)
      yield snack
    end
  end

  def total_carbs_per_movie
    @snack_carbs.values.reduce(0, :+) 
  end

  def to_s
    "#{@title} has a rank of".ljust(30, '.') + "#{@rank.to_s.rjust(3, ' ')}, it's a #{status} (#{stars.empty? ? "No stars" : stars})"
  end

  def to_csv
    "#{@title},#{@rank}"
  end
end

if __FILE__ == $0
  movie = Movie.new(title: "goonies", rank: 10)
  puts movie
  movie.thumbs_up
  puts movie.rank
end