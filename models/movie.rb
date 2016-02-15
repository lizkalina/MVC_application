class Movie

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.names
    Review.all.collect do |review|
      review.movie.name
    end.uniq.sort
  end

end