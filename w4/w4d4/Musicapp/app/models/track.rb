class Track < ActiveRecord::Base
  validates :name, :album_id, :ord, presence: true

  belongs_to :album
end
