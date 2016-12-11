# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  validates :title, :author, presence: true
  validate :atleast_one_sub

  def atleast_one_sub
    self.subs.length >= 1
  end

  has_many :postsubs,
  foreign_key: :post_id,
  dependent: :destroy,
  inverse_of: :post

  has_many :subs, through: :postsubs

  belongs_to :author,
  foreign_key: :author_id,
  class_name: "User"

end
