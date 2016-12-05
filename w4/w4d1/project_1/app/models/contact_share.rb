# == Schema Information
#
# Table name: contact_shares
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  contact_id :integer          not null
#

class ContactShare < ActiveRecord::Base
  validates :user_id, :contact_id, presence: true, uniqueness: true

  belongs_to :contact,
  primary_key: :id,
  foreign_key: :contact_id,
  class_name: :Contact

  belongs_to :user,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User
end
