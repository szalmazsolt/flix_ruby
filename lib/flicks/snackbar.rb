# Snack = Struct.new(:name, :carbs)
# 
# The attribute of a class created from Struct (in this case, a Snack) can be modified during the running of the program

module SnackBar
  # A Date structure defines a class whose attributes unlike Struct attributes cannot be modified
  Snack = Data.define(:name, :carbs)

  # Constants in Ruby are all upper-cased, except for class names
  SNACKS = [
    Snack.new(:popcorn, 15),
    Snack.new(:soda, 5),
    Snack.new(:nachos, 20),
    Snack.new(:candy, 10),
  ]

  def self.get_random
    SNACKS.sample
  end

  def self.menu_items
    SNACKS.map {|snack| "#{snack.name} with #{snack.carbs} carbs"}
  end
end

if __FILE__ == $0
  puts SnackBar::SNACKS
  snack = SnackBar.get_random
  puts "You picked #{snack.name} of #{snack.carbs} carbs"
end