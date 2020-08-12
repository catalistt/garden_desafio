# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Para crear 10 registros random de plantas
#Se debe correr el comando en la consola 'rails db:seed'
10.times do
  Plant.create(name: Faker::TvShows::Simpsons.character, kingdom: Faker::TvShows::Simpsons.location)
end