# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |i|
  User.create!(name: Faker::Name.name, email: Faker::Internet.email, biography: Faker::Lorem.paragraph(sentence_count: 2))
end

User.all.each do |user|
  user.posts.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph(sentence_count: 10))
end 