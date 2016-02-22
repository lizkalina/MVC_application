require_relative '../config/environment.rb'
require_relative '../concerns/databaseable.rb'
require 'pry'

class Moviegenre

  extend Databaseable::ClassMethods
  include Databaseable::InstanceMethods

  self.column_names.each do |col_name|
    attr_accessor col_name.to_sym
  end

end