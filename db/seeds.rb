# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.delete_all

Restaurant.create!(name: 'Garden Grill', location: 'EPCOT: The Lands', will_split_votes: 0, will_not_split_votes: 0)
Restaurant.create!(name: 'Sunshine Seasons', location: 'EPCOT: The Lands', will_split_votes: 0, will_not_split_votes: 0)
Restaurant.create!(name: 'Space 220', location: 'EPCOT: Future World', will_split_votes: 0, will_not_split_votes: 0)
Restaurant.create!(name: 'Skipper Canteen', location: 'Magic Kingdom: Adventureland', will_split_votes: 0, will_not_split_votes: 0)
Restaurant.create!(name: 'Liberty Tree Tavern', location: 'Magic Kingdom: Liberty Square', will_split_votes: 0, will_not_split_votes: 0)
Restaurant.create!(name: 'The Brown Derby', location: 'Disney Studios: Hollywood Boulevard', will_split_votes: 0, will_not_split_votes: 0)
Restaurant.create!(name: 'Tiffins Restaurant', location: 'Animal Kingdom: Discovery Island', will_split_votes: 0, will_not_split_votes: 0)
