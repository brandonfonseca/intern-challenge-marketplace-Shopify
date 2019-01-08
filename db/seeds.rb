# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Product.create([{title: "Apple", price: 0.50, inventory_count: 30},
                {title: "Pear", price: 0.75, inventory_count: 10},
                {title: "Carrot", price: 0.70, inventory_count: 75},
                {title: "Cheerios Box", price: 3.00, inventory_count: 20},
                {title: "Goldfish Crackers", price: 2.50, inventory_count: 25},
                {title: "Paper Towel Roll", price: 5.00, inventory_count: 50},
                {title: "Swiffer Mop", price: 17, inventory_count: 8},
                {title: "Tissue Box", price: 2.75, inventory_count: 23},
                {title: "Tortillas", price: 1.75, inventory_count: 53},
                {title: "KitKat Bar", price: 1.10, inventory_count: 35}
               ])
