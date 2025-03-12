def three_times
  puts "Running method"
  yield 1
  yield 2
  yield "Three"
  puts "Running method again"
end

three_times { |n| puts "#{n} Running the block" }

def compute
  puts "Let's compute..."
  if block_given?
    result = yield
    puts result
  else
    puts "Does not compute"
  end
end

compute do
  "Hello, world!"
  4.5
end

numbers = (1..10).to_a
puts numbers.select {|n| n.even?}

def my_select(nums)
  result = []
  nums.each do |n|
    result << n if yield n
  end
  result
end

puts my_select(numbers) {|n| n.odd?}