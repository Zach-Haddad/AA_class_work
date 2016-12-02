require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns #no query if already exists!
    cols = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
      LIMIT
        0
    SQL

    @columns = cols.flatten.map(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |col|
      define_method(col) do
        self.attributes[col]
      end
    end

    self.columns.each do |col|
      define_method("#{col}=") do |val|
        self.attributes[col] = val
      end
    end

  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

# http://edgeguides.rubyonrails.org/active_support_core_extensions.html#extensions-to-string
  def self.table_name
    @table_name ||= self.name.underscore.pluralize
  end

  def self.all
    res = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL

    parse_all(res)
  end

  def self.parse_all(results)
    results.map { |result| self.new(result) }
  end

  def self.find(id)
    res = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{table_name}.id = ?
    SQL

    parse_all(res)[0]
  end

  def initialize(params = {})
    params.each do |param, val|
      new_attr = param.to_sym
      if self.class.columns.include?(new_attr)
        self.send("#{new_attr}=", val)
      else
        raise "unknown attribute '#{new_attr}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map { |attribute| self.send(attribute) }
  end

  def insert
    cols = self.class.columns.drop(1).map(&:to_s)
    col_names = cols.join(", ")
    question_marks = (["?"] * cols.length).join(", ")
    DBConnection.execute(<<-SQL, *attribute_values.drop(1))
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    set_line = self.class.columns.drop(1).map { |col| "#{col} = ?" }.join(", ")
    DBConnection.execute(<<-SQL, *attribute_values.drop(1), self.id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_line}
      WHERE
        id = ?
    SQL
  end

  def save
    self.id ? self.update : self.insert
  end
end
