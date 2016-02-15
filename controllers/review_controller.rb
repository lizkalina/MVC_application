class ReviewsController

  def new
    view = ReviewNewView.new
    view.render
  end

  def create(movie)
    review = Review.new(movie)
  end

  def prompt_review
    view = ReviewTextView.new
    view.render
  end

  def add_review(review,user_input)
    review.review_text = user_input
  end

  def prompt_star_count
    input = 0
    while !['*','**','***','****','*****'].include? (input)
      view = ReviewStarCountView.new
      input = view.render
    end
    input
  end

  def add_star_count(review,user_input)
    review.star_count = user_input
  end

  def search_by_movie
    view = ReviewMovieView.new
    view = view.render
    while view == 'list'
      print_movie_list
      view = ReviewMovieView.new
      view = view.render
    end
    view
  end

  def print_movie_list
    view = PrintMovieList.new
    view.render
  end

  def find_reviews_by_movie(movie_name)
    Review.all.select{|review| review.movie.name == movie_name if review.movie.name != nil} || "No reviews available"
  end

  def search_by_rating
    view = ReviewRatingView.new
    view.render
  end

  def find_reviews_by_rating(count)
    Review.all.select{|review| review.star_count == count} || "No reviews available"
  end

  def print_movie(movie,reviews)
    if reviews.count == 0
      view = ReviewNoneView.new
      view.render
    else
      view = ReviewMoviePrintView.new
      view.render(movie,reviews)
    end
  end

  def print_rating(rating,reviews)
    if reviews.count == 0
      view = ReviewNoneView.new
      view.render
    else
      view = ReviewRatingPrintView.new
      view.render(rating, reviews)
    end
  end

  # def print_genre(reviews)
  #   view = ReviewGenrePrintView.new
  #   view.render(reviews)
  # end

end