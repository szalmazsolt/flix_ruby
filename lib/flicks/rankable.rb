module Rankable
  def num_of_stars
    return self.rank / 2 unless self.rank <= 0
    0
  end

  # endless methods
  def stars = '⭐️' * num_of_stars

  def hit? = self.rank >= 10

  def status 
    hit? ? 'Hit' : 'Flop'
  end

  def thumbs_up = self.rank += 1

  def thumbs_down
    # puts self.inspect
    self.rank -= 1 if self.rank > 0
  end
end