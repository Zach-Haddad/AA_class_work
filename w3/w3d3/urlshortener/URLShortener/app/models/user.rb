class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  has_many :shortened_urls,
    foreign_key: :user_id,
    class_name: :ShortenedUrl,
    primary_key: :id

  has_many :submitted_urls,
    foreign_key: :user_id,
    class_name: :ShortenedUrl,
    primary_key: :id

  has_many :visits,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Visit

  has_many :visited_urls, through: :visits, source: :shortened_url

end
