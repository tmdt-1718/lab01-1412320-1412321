# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
album = Album.create([ { name: "Timeline", total_views: 0, user_id: 1, cover_url: "/uploads/cat.jpg" },
                       { name: "Mobile upload", total_views: 0, user_id: 1, cover_url: "/uploads/cat.jpg" } ])
user = User.create([
    { 
        name: "Luong Nhat Minh", 
        email: "minhluong96@gmail.com", 
        password: "1234567", 
        confirmed_at: DateTime.now
    },

    { 
        name: "Le Quoc Minh", 
        email: "quocminh97@gmail.com", 
        password: "1234567", 
        confirmed_at: DateTime.now
    }
])

blog = Blog.create([
    {
        url: "/uploads/minh.jpg",
        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In non posuere enim, a ultricies felis\nLorem ipsum dolor sit amet, consectetur adipiscing elit. In non posuere enim, a ultricies felis\nLorem ipsum dolor sit amet, consectetur adipiscing elit. In non posuere enim, a ultricies felis", 
        user_id: 2, 
        view_count: 5, 
        title: "Lorem Ipsum 1"
    },

    {
        url: "/uploads/cat.jpg",
        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In non posuere enim, a ultricies felis", 
        user_id: 2, 
        view_count: 10, 
        title: "Lorem Ipsum 2"
    }
])
