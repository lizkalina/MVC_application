class MoviesController

  def find_or_create(movie_name)
    existing_review = Review.all.find do |review| 
      if review.movie.name != nil
        review.movie.name == movie_name
      end
    end
    existing_review != nil ? existing_review.movie : Movie.new(movie_name)
  end

end