require_relative '../config/environment.rb'
# require_relative 'seed.rb'
require 'sqlite3'


def reload!
    load('../config/environment.rb')
end

action = 0
while action != 'exit'
  puts "What would you like to do today? (write a review, find reviews)"
  action = gets.chomp
  case action
    when 'write a review'
      controller = ReviewsController.new
      movie_name = controller.new
      
      controller = MoviesController.new
      movie = controller.find_or_create(movie_name)
      
      controller = ReviewsController.new
      review = controller.create(movie)

      controller = ReviewsController.new
      user_input = controller.prompt_review
      controller = ReviewsController.new
      controller.add_review(review,user_input)
      controller = ReviewsController.new
      star_count = controller.prompt_star_count
      controller = ReviewsController.new
      controller.add_star_count(review,star_count)

    when 'find reviews'
      puts 'How would you like to find reviews? (movie, rating, genre)'
      action = gets.chomp

      case action
      when 'movie'
        controller = ReviewsController.new
        movie_name = controller.search_by_movie
        controller = ReviewsController.new
        reviews = controller.find_reviews_by_movie(movie_name)
        controller = ReviewsController.new
        controller.print_movie(movie_name,reviews)

      when 'rating'
        controller = ReviewsController.new
        rating = controller.search_by_rating
        controller = ReviewsController.new
        reviews = controller.find_reviews_by_rating(rating)
        controller = ReviewsController.new
        controller.print_rating(rating,reviews)

      when 'genre'

      end

  end

end

#Pry.start