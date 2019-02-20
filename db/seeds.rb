# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
perchoir = Rooftop.create(name: "perchoir", description: "jolie vue", address: "14 rue crespin du gast, paris", user_id: 2, price_per_hour: 50)

mama_shelter = Rooftop.create(name: "mama shelter", description: "jolie vue", address: "109 rue de Bagnolet 75020 Paris", user_id: 2, price_per_hour: 100)
