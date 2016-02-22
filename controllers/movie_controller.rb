class MoviesController

  def find_or_create(movie_name)
    Movie.find_or_create(title: movie_name)
  end

  def prompt_genre
    view = PromptGenre.new
    view.render
  end

  def find_movie_by_genre(genre)
    genre = Genre.find_by(name:genre).first
    genre_id = genre["id"]
    sql = <<-SQL
      SELECT movies.title FROM movies
      INNER JOIN moviegenres 
      ON movies.id = moviegenres.movie_id
      INNER JOIN genres 
      ON genres.id = moviegenres.genre_id
      WHERE genres.id = ?;
    SQL
    movies = DB[:conn].execute(sql, genre_id)
    movies.collect {|movie| movie["title"]}.uniq.sort
  end

  def print_movies(movies)
    view = PrintMovies.new
    view.render(movies)
  end
end