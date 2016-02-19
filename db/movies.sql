CREATE TABLE reviews (
  id INTEGER PRIMARY KEY, 
  movie TEXT,
  review_text TEXT,
  star_count INTEGER
);

CREATE TABLE movies (
  id INTEGER PRIMARY KEY, 
  title TEXT,
  genre_id INTEGER
);

CREATE TABLE genres (
  id INTEGER PRIMARY KEY, 
  genre TEXT
);

CREATE TABLE movies_reviews (
  id INTEGER PRIMARY KEY, 
  movie_id INTEGER,
  review_id INTEGER
);