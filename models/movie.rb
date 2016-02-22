require_relative '../config/environment.rb'
require_relative '../concerns/databaseable.rb'
require 'pry'

class Movie

  extend Databaseable::ClassMethods
  include Databaseable::InstanceMethods

  # attr_accessor :name, :genre
  # attr_reader :id

  # self.column_names.each do  

  self.column_names.each do |col_name|
    attr_accessor col_name.to_sym
  end

  # def initialize(id = nil, name)
  #   @id = id
  #   @name = name
  # end


  # def self.create_table
  # sql =  <<-SQL 
  #   CREATE TABLE IF NOT EXISTS movies (
  #     id INTEGER PRIMARY KEY, 
  #     name TEXT
  #     );
  #     SQL
  #     # genre_id INTEGER <-- not sure if this should be here or not, it's in the table, but i'm uncertain as to 
  #     # whether or not this is how we incorporate an ID like this in ruby. 
  # DB[:conn].execute(sql) 
  # end
  # def save
  #   sql = <<-SQL
  #     INSERT INTO movies (name) 
  #     VALUES (?)
  #   SQL
  #   DB[:conn].execute(sql, self.name)
  #   sql = <<-SQL
  #     SELECT * FROM movies
  #     ORDER BY movies.id DESC
  #     LIMIT 1
  #   SQL
  #   @id = DB[:conn].execute(sql)[0][0]
  # end

  def self.find(id)
    sql = <<-SQL 
    SELECT * FROM movies WHERE id = ?
    SQL
    DB[:conn].execute(sql, id)
  end

  # def self.all
  #   sql = <<-SQL
  #   SELECT * FROM movies
  #   SQL
  #   DB[:conn].execute(sql)
  # end
  # def self.names
  #   Movie.all.collect do |review|
  #     review.movie.name
  #   end.uniq.sort
  # end
binding.pry

puts 
end

