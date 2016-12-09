class Album < ActiveRecord::Base
  validates :name, :band_id, :recording, presence: true
  validates :recording, inclusion: %w(L S)

  belongs_to :band
  has_many :tracks, dependent: :destroy


end
