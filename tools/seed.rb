# movies = ['Zoolander','Braveheart','Clueless','Oceans Eleven','Fight Club'].collect do |name|
#   Movie.new(name)
# end

# ratings = ['*','**','***','****','*****']
# texts = ['Great movie!', 'This movie sucked.', 'Would recommend highly.', 'Two thumbs down','Fine','Go see it!','Da bomb.','Alright']
# genres = ['action', 'romance', 'horror']

# reviews = 25.times.collect do |review|
#   movie = movies.shuffle.first
#   star_count = ratings.shuffle.first
#   text = texts.shuffle.first
#   genre = genres.shuffle.first
#     review = Review.new(movie).tap do |review|
#       review.review_text = text
#       review.star_count = star_count
#       movie.genre = genre
#     end
# end



# reviews.each do |review|
#   puts review
#   puts review.movie
#   puts review.movie.name
#   puts review.review_text
#   puts review.star_count
# end

