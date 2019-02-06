# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
UserAdmin.create(name: "Navin", email: "dummy@flight.com", password: "dummy123")
5.times do
	Airplane.create!(
		name: Faker::Name.name,
		seats: Faker::Number.number(2),
		category: "Buisness",
		rows: Faker::Number.number(1),
		source: Faker::Address.state_abbr,
		destination: Faker::Address.state_abbr,
		price: Faker::Number.decimal(4)
		)
end