require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    @class_name.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    defaults = {
      foreign_key: "#{name}_id".to_sym,
      primary_key: :id,
      class_name: name.to_s.camelcase
    }

    defaults.each do |k, v|
      val = options[k].nil? ? defaults[k] : options[k]
      self.send("#{k}=", val)
    end
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    defaults = {
      foreign_key: "#{self_class_name.underscore}_id".to_sym,
      primary_key: :id,
      class_name: name.to_s.camelcase.singularize
    }

    defaults.each do |k, v|
      val = options[k].nil? ? defaults[k] : options[k]
      self.send("#{k}=", val)
    end
  end
end

# Begin writing a belongs_to method for Associatable.
 # This method should take in the association name and an options
 # hash. It should build a BelongsToOptions object; save
 # this in a local variable named options.
#
# Within belongs_to, call define_method to create a
#  new method to access the association. Within this method:
#
# Use send to get the value of the foreign key.
# Use model_class to get the target model class.
# Use where to select those models where the primary_key column is
#  equal to the foreign key value.
# Call first (since there should be only one such item).
# Throughout this method definition, use the options object so
# that defaults are used appropriately.

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    self.assoc_options[name] = BelongsToOptions.new(name, options)

    define_method(name) do
      options = self.class.assoc_options[name]
      foreign_key_val = self.send(options.foreign_key)
      options
        .model_class
        .where(options.primary_key => foreign_key_val)
        .first
    end
  end

  def has_many(name, options = {})
    self.assoc_options[name] = HasManyOptions.new(name, self.name, options)

    define_method(name) do
      options = self.class.assoc_options[name]
      primary_key_val = self.send(options.primary_key)
      options
        .model_class
        .where(options.foreign_key => primary_key_val)
    end
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
    @assoc_options ||= {}
    @assoc_options
  end
end

class SQLObject
  extend Associatable
end
