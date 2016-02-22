class ReviewTextView
  
  def render(movie)
    puts "Write your review here:"
    review_text = gets.chomp
    puts "How many stars would you give this movie? (1 to 5)"
    star_count = gets.chomp
    movie_id = movie.id
    {review_text:review_text, star_count:star_count, movie_id:movie_id}
  end
  
end