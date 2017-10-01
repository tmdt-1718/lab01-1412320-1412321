# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create([{ name: "Luong Nhat Minh", email: "minhluong96@gmail.com", password: "1234567", confirmed_at: DateTime.now, }])
album = Album.create([ { name: "Timeline", total_views: 20, user_id: 1, cover_url: "/uploads/cat.jpg" },
                       { name: "Mobile upload", total_views: 0, user_id: 1, cover_url: "/uploads/cat.jpg" } ])
