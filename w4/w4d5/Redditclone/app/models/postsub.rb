# == Schema Information
#
# Table name: postsubs
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Postsub < ActiveRecord::Base
  validates :post, :sub, presence: true
  validates :post_id, uniqueness: { scope: :sub_id }
  

  belongs_to :post, foreign_key: :post_id

  belongs_to :sub, foreign_key: :sub_id
end
