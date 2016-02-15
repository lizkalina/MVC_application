class ReviewRatingPrintView

  def render(star_count, reviews)
    count = 1
    puts "Here are all #{star_count} star count reviews:"
    reviews.each do |review|
      puts "Review #{count}"
      puts review.movie.name
      puts review.star_count
      puts review.review_text
      count += 1
    end
  end

end