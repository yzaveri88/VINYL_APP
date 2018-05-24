# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create(email: "yash@google.com", password: "123123", password_confirmation: "123123" )
p users


6.times do
record = Record.create(user_id: 1, year: 1967,title:"Dark Side of the Moon",artist:"Pink Floyd",genre:"Rock",label:"Polydor" ,price:10, address: "Friedrichstrasse 55, Berlin")
end

7.times do
record = Record.create(user_id: 2, year: 1988,title:"Dark Side",artist:"ZZ Top",genre:"Rock",label:"Epic" ,price:5.9, address: "Danziger Strasse 100, Berlin")
end
# record_10 = Record.new(year:,title:,artist:,genre: ,label: ,price:)

record_new = Record.create(user_id: 5, year: 1988, title:"Best of David Bowie", artist:"David Bowie", genre:"Rock", label:"Enigma", price:10, address: "Friedrichstrasse 100, Berlin")
