require_relative 'lib/flicks/movie'
require_relative 'lib/flicks/playlist'

playlist1 = Playlist.new("Kermit")
playlist1.load(ARGV.shift || 'movies.csv')

loop do
  print "How many viewings? ('quit' or 'q' to exit) "
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    playlist1.play(answer.to_i)
  when 'quit', 'q'
    playlist1.print_stats
    playlist1.save
    break
  else
    puts "Please enter a valid number!"
  end
end




