# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


100.times do
  random_photo = "http://api.randomuser.me/portraits/#{rand > 0.5 ? "men" : "women"}/#{(rand * (96 - 1) + 1).round}.jpg"
  user = User.new(
    email: Faker::Internet.email,
    password: "dreamteam",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    photo: random_photo,
    address: Faker::Address.street_address,
    zipcode: Faker::Address.zip_code,
    city: Faker::Address.city,
    description: Faker::Hipster.paragraph)
  user.save
end

150.times do
  item = Item.new(
    name: DRUGS[rand(DRUGS.length - 1)],
    in_stock: rand > 0.8 ? true : false,
    price: (rand * (300 - 15) + 15).round(2),
    user: User.all.sample)
  item.save
end

200.times do
  deal = Deal.new(
    user: User.all.sample,
    total_price: (rand * (1_500 - 15) + 15).round(2),
    rating: (0..5).to_a.sample,
    item: Item.all.sample,
    status: %w(Pending Validated Cancelled).sample)
  deal.save
end
