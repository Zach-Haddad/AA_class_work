class Person < ActiveRecord::Base
  belongs_to(
  :house,
  class_name: "House",
  foreign_key: :reference,
  primary_key: :id
)
end
