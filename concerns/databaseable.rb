require_relative '../config/environment.rb'

module Databaseable

  module ClassMethods
    def db
      DB[:conn]
    end
    def table_name
      "#{self.to_s.downcase}s"
    end

    def column_names
      db.results_as_hash = true

      sql = "pragma table_info('#{table_name}')"

      table_info = db.execute(sql)
      column_names = []
      table_info.each do |row|
        column_names << row["name"]
      end
      column_names.compact
    end

    def find_by(attribute) # will be a key value pair
      header = attribute.keys.join
      value = attribute.values.join
      if value.is_a? Integer
        sql= "SELECT * FROM #{self.table_name} WHERE #{header} = #{value}"
      else
        sql= "SELECT * FROM #{self.table_name} WHERE #{header} = '#{value}'"
      end
      row = db.execute(sql)
    end


    def find_or_create(attribute)

      output = self.find_by(attribute)

      if !output.empty?
        output
      else
        new_instance = self.new(attribute)
        new_instance.save
      end
      new_instance
    end

    def all
      sql = <<-SQL
        SELECT * FROM "#{self.table_name}"
      SQL
      db.execute(sql)
    end

  end




  module InstanceMethods

    def initialize(options={})
      options.each do |property, value|
        self.send("#{property}=", value)
      end
    end

    def table_name_for_insert
      self.class.table_name
    end

    def values_for_insert
      values = []
      self.class.column_names.each do |col_name|
        values << "'#{send(col_name)}'" unless col_name == "id"
      end
      values.join(", ")
    end

    def col_names_for_insert
      self.class.column_names.delete_if { |col| col == "id" }.join(", ")
    end

    def save
      sql = "INSERT INTO #{table_name_for_insert} (#{col_names_for_insert}) VALUES (#{values_for_insert})"
      DB[:conn].execute(sql)

      sql = <<-SQL
        SELECT * FROM "#{self.class.table_name}"
        ORDER BY id DESC
        LIMIT 1
      SQL
      @id = DB[:conn].execute(sql)[0][0] 
    end

  end


end

