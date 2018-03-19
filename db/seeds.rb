# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seeding race1"
race1 = Race.new(name:"Triathlon de Deauville", sport:"Triathlon", format:"Triathlon Longue Distance", starts_at:"Sat, 17 Mar 2018 12:00:00 UTC +00:00", address:"Deauville", year:"2018", description:"Triathlon de Deauville Description", url:"https://triathlondeauville.com/", registration_url:"https://www.njuko.net/tid2018/select_competition", available_slots:1000, distance_swim:1.9, distance_bike:90, distance_run:21.1, vertical_ascent_bike:1500, vertical_ascent_run:100)
race1.save
puts "seed race1 complete"
