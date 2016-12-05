class ShortenedUrl < ActiveRecord::Base
  validates :short_url, :long_url, :user_id, presence: true
  validates :short_url, length: { maximum: 1024 }

  belongs_to :user,
    foreign_key: :user_id,
    class_name: :User,
    primary_key: :id

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visitors, through: :visits, source: :visitor

  has_many :visits,
    primary_key: :id,
    foreign_key: :shortened_urls_id,
    class_name: :Visit


  def self.random_code
    new_url = nil
    loop do
      string = SecureRandom.urlsafe_base64
      new_url = "www.#{string}.com"
      break unless self.exists?(new_url)
    end
    new_url
  end

  def self.create_for_user_and_long_url!(user, long_url)
    self.create(short_url: self.random_code, user_id: user.id,
    long_url: long_url)
  end

  def num_clicks
    Visit.select{|visit| visit.shortened_urls_id == self.id}.count
  end

  def num_uniques
    Visit.select(:user_id).distinct.where(:shortened_urls_id == self.id).count
  end

  def num_recent_uniques
    minutes_ago = 10.minutes.ago
    hits = Visit.select do |visit|
      visit.shortened_urls_id = self.id &&
      visit.created_at > minutes_ago
    end

    hits.uniq.count
  end

end
