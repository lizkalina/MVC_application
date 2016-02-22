class PrintMovieList
  def render
    movies = Movie.all.sort_by { | movie | movie["title"] }
    movies.each do |movie|
      puts movie["title"]
    end
  end
end