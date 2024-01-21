# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Search.create(query: 'Ruby on Rails', user_ip: '192.168.0.1')
Search.create(query: 'ReactJS', user_ip: '192.168.0.2')

