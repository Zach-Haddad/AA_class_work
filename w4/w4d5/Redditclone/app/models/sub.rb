# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  description  :text             not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ActiveRecord::Base
  validates :title, :description, :moderator, presence: true

  belongs_to :moderator,
  foreign_key: :moderator_id,
  class_name: "User"

  has_many :posts, through: :postsubs

  has_many :postsubs,
  foreign_key: :sub_id,
  dependent: :destroy,
  inverse_of: :sub

end
