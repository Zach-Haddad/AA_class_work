class Visit < ActiveRecord::Base
  validates :user_id, :shortened_urls_id, presence: true

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :shortened_url,
    primary_key: :id,
    foreign_key: :shortened_urls_id,
    class_name: :ShortenedUrl

  belongs_to :visitors,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :visited_urls,
    primary_key: :id,
    foreign_key: :shortened_urls_id,
    class_name: :ShortenedUrl

  def self.record_visit!(user, shortened_url)
    Visit.create!(user_id: user.id, shortened_urls_id: shortened_url.id)
  end
end
