# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


gym1 = Gym.create(name: "JEM-court", description: "LA indoor gym", address_1: "123 Testing Avenue", address_2: "Suite 105", city: "Los Angeles", state: "CA", guests: 20, price: "200")
gym2 = Gym.create(name: "primetime-court", description: "LA indoor gym", address_1: "123 Testing Avenue", address_2: "Suite 102", city: "Los Angeles", state: "CA", guests: 25, price: "250")
gym3 = Gym.create(name: "pickupusa-court", description: "LA indoor gym", address_1: "123 Testing Avenue", address_2: "Suite 103", city: "Los Angeles", state: "CA", guests: 10, price: "150")