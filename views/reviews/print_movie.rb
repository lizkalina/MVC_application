class ReviewMoviePrintView

  def render(movie_name,reviews)
    count = 1
    puts "Here are the reviews for #{movie_name}:"
    reviews.each do |review|
      puts "\nReview #{count}"
      puts "#{review["star_count"]} Star(s)"
      puts review["review_text"]
      count += 1
    end
  end

end