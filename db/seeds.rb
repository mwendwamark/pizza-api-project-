# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

puts "Seeding pizza ...."

25.times do
  Restaurant.create(
    name: Faker::Restaurant.name,
    address: "#{Faker::Address.building_number}, #{Faker::Address.street_address}, #{Faker::Address.street_name}",
  )
end
30.times do
  Pizza.create(
    name: Faker::Food.dish,
    ingredients: Array.new(10) { Faker::Food.ingredient }.join(","),
  )
end
70.times do
  RestaurantPizza.create(
    price: Faker::Number.between(from: 1, to: 30),
    pizza_id: Faker::Number.between(from: 1, to: 30),
    restaurant_id: Faker::Number.between(from: 1, to: 25),
  )
end

puts "Done seeding."
