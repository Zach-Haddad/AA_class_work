# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do

  User.destroy_all
    user1 = User.create(email: "one@test.com")
    user2 = User.create(email: "two@test.com")
    user3 = User.create(email: "three@test.com")
    user4 = User.create(email: "four@test.com")
    user5 = User.create(email: "five@test.com")

  ShortenedUrl.destroy_all
    site1 = ShortenedUrl.create_for_user_and_long_url!(user1, "www.longsampleone.com")
    site2 = ShortenedUrl.create_for_user_and_long_url!(user2, "www.longsampletwo.com")
    site3 = ShortenedUrl.create_for_user_and_long_url!(user3, "www.longsamplethree.com")

  Visit.destroy_all
    visit1 = Visit.record_visit!(user4, site2)
    visit2 = Visit.record_visit!(user5, site1)
    visit3 = Visit.record_visit!(user1, site3)
    visit4 = Visit.record_visit!(user1, site3)
    visit5 = Visit.record_visit!(user4, site1)
end
