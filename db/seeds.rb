# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
perchoir = Rooftop.new(user_id: 0, name: "Perchoir", address: "14 rue crespin du gast 75011 Paris", description: "Very nice terrasse truly appreciated by Le Wagon's students", price_per_hour: "150")
perchoir.save
