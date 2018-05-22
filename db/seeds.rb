# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create(email: "yash@google.com", password: "123123", password_confirmation: "123123" )
p users


12.times do
record = Record.create(user_id: 1, year: 1967,title:"Dark Side of the Moon",artist:"Pink Floyd",genre:"Rock",label:"Polydor" ,price:10)
end
# record_10 = Record.new(year:,title:,artist:,genre: ,label: ,price:)

