require_relative 'movie'

module Flicks
  class Movie3D < Movie

    def initialize(title:, rank:, wow_factor: 10)
      super(title:, rank:)
      @wow_factor = wow_factor
    end

    def show_effect
      puts "Wow! " * @wow_factor
    end

    def thumbs_up
      @wow_factor.times { super }
    end
    
  end
end

if __FILE__ == $0
  movie3d = Flicks::Movie3D.new(wow_factor: 3, title: "Avatar", rank: 7)
  movie3d.thumbs_up
  puts movie3d
  movie3d.show_effect
  p Flicks::Movie3D.superclass
  p Flicks::Movie3D.ancestors
end