require 'pry'
require_relative '../config/environment.rb'

def reload!
    load('../config/environment.rb')
end

action = 0
while action != 'exit'
  puts "What would you like to do today? (write a review, find reviews, browse movies)"
  action = gets.chomp
  case action
    when 'write a review'

      controller = ReviewsController.new
      movie_name = controller.new
      
      controller = MoviesController.new
      movie = controller.find_or_create(movie_name)
      
      controller = ReviewsController.new
      user_input = controller.prompt_review(movie)

      controller = ReviewsController.new
      review = controller.create(user_input)

      controller = ReviewsController.new
      controller.add_review(review)


    when 'find reviews'
      puts 'How would you like to find reviews? (movie, rating)'
      action = gets.chomp

      case action
      when 'movie'
        controller = ReviewsController.new
        movie_name = controller.prompt_movie

        controller = ReviewsController.new
        reviews = controller.find_reviews_by_movie(movie_name)

        controller = ReviewsController.new
        controller.print_movie(movie_name,reviews)

      when 'rating'
        controller = ReviewsController.new
        rating = controller.prompt_rating

        controller = ReviewsController.new
        reviews = controller.find_reviews_by_rating(rating)

        controller = ReviewsController.new
        controller.print_rating(rating,reviews)
      end
    
    when 'browse movies'
      puts 'How would you like to browse movies? (genre, average rating)'
      action = gets.chomp
      
      case action 
      when 'genre'
        controller = MoviesController.new
        genre = controller.prompt_genre
        
        controller = MoviesController.new
        movies = controller.find_movie_by_genre(genre)
        
        controller = MoviesController.new
        controller.print_movies(movies)
      
      when 'average rating'
        controller = MoviesController.new
      end
    end
end

#Pry.start