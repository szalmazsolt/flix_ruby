Snack = Struct.new(:name, :carbs)

module SnackBar
  SNACKS = [
    Snack.new(:popcorn, 10),
    Snack.new(:nachos, 40),
    Snack.new(:candy, 15),
    Snack.new(:pretzel, 10),
    Snack.new(:soda, 5)
  ]

  def self.get_random
    SNACKS.sample
  end
end

if __FILE__ == $0
  puts SnackBar::SNACKS
  snack = SnackBar.get_random
  puts "You picked #{snack.name} of #{snack.carbs} carbs"
end