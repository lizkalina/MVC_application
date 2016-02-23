class ReviewsController

  def new
    view = ReviewNewView.new
    view.render
  end

  def prompt_review(movie)
    view = PromptReviewView.new
    view.render(movie)
  end

  def create(attributes)
    review = Review.new(attributes)
  end

  def add_review(review)
    review.save
  end

  def find_reviews_by_movie(movie_name)
    movie = Movie.find_by(title:movie_name).first
    movie_id = movie["id"]
    Review.find_by(movie_id:movie_id) || "No reviews available"
  end #returns an array of all matching movies

  def print_movie(movie_name,reviews)
    if reviews.count == 0
      view = ReviewNoneView.new
      view.render
    else
      view = ReviewMoviePrintView.new
      view.render(movie_name,reviews)
    end
  end

  def prompt_movie
    view = ReviewMovieView.new
    view = view.render
    while view == 'list'
      print_movie_list
      view = ReviewMovieView.new
      view = view.render
    end
    view
  end

  def prompt_rating
    view = PromptRatingView.new
    view.render
  end

  def print_movie_list
    view = PrintMovieList.new
    view.render
  end

  def find_reviews_by_rating(rating)
    Review.find_by(star_count:rating) || "No reviews available"
  end


  def print_rating(rating,reviews)
    if reviews.count == 0
      view = ReviewNoneView.new
      view.render
    else
      view = ReviewRatingPrintView.new
      view.render(rating,reviews)
    end
  end

end