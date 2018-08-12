# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.create(name: "seed-generated product", description: "I also created this product without using the HTML form!")
colors = %w(red blue green purple yellow orange pink)

10.times do |n|
  Product.create(
    name: "product #{n+1}",
    description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
    image_url: "http://www.placehold.it/400x300",
    color: colors.sample,
    price: rand(1..100)
  )
end

User.create(
  first_name: 'User',
  last_name: 'Ipsum',
  email: 'user@email.com',
  password: 'password1!'
)
