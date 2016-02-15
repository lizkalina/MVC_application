class Review

  attr_accessor :movie, :review_type, :review_text, :star_count

  @@all = []

  def initialize(movie)
    @movie = movie
    @@all << self
  end


  def self.all
    @@all
  end


end
