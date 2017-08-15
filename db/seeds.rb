# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create seed data for site and testing.

puts "Clearing Old Data"
Shorty.destroy_all

puts "---  Creating Shorties   ---"
200.times do
  Shorty.create!(original: Faker::Internet.url, shortened: Faker::Internet.password(5, 5), use_count: rand(0..10))
end
