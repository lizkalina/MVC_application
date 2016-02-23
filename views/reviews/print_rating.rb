class ReviewRatingPrintView

  def render(star_count, reviews)
    count = 1
    puts "Here are all #{star_count} star(s) reviews:"
    reviews.each do |review|
      sql = <<-SQL
        SELECT movies.title FROM movies
        INNER JOIN reviews 
        ON movies.id = reviews.movie_id
        WHERE reviews.id = ?;
      SQL
    movie = DB[:conn].execute(sql, review["id"]).first["title"]
      puts "\nReview #{count}"
      puts movie
      puts "#{review["star_count"]} Star(s)"
      puts review["review_text"]
      count += 1
    end
  end

end