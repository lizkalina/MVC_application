class PrintGenreList
  def render
    genres = Genre.all.collect{ |genre| genre["name"] }.sort
    genres.each do |genre|
      puts genre
    end
  end
end