require_relative 'lib/flicks/movie'
require_relative 'lib/flicks/playlist'

movie1 = Movie.new(title: "goonies", rank: 3)
movie2 = Movie.new(rank: 9, title: "ghostbusters")
movie3 = Movie.new(title: "goldfinger")

playlist1 = Playlist.new("Kermit")
playlist1.add_movie(movie1)
playlist1.add_movie(movie2)
playlist1.add_movie(movie3)
playlist1.play(3)
playlist1.print_stats

# playlist2 = Playlist.new("fozzie")
# playlist2.add_movie(movie3)
# movie4 = Movie.new(title: "gremlins", rank: 8)
# playlist2.add_movie(movie4)
# playlist2.play(2)