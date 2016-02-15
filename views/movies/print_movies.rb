class PrintMovies
  def render(movies)
    movies.each {|movie| puts movie.name}
  end
end