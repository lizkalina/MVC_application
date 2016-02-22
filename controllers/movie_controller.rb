class MoviesController

  def find_or_create(movie_name)
    Movie.find_or_create(title: movie_name)
  end

  # def find_or_create(movie_name)
  #   existing_review = Review.all.find do |review| 
  #     if review.movie.name != nil
  #       review.movie.name == movie_name
  #     end
  #   end
  #   existing_review != nil ? existing_review.movie : Movie.new(movie_name)
  # end

  # def prompt_genre
  #   view = PromptGenre.new
  #   view.render
  # end

  # def find_movie_by_genre(genre)
  #   Review.all.collect do |review|
  #     if review.movie.genre == genre
  #       review.movie
  #     end
  #   end.compact.uniq
  # end

  # def print_movies(movies)
  #   view = PrintMovies.new
  #   view.render(movies)
  # end
end