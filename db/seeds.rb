# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Race.destroy_all

sport = ["Triathlon", "Running", "Road Cycling", "Obstacle", "Swimming", "Mountain Biking", "Duathlon", "SwimRun"]
address = ["Paris", "Lyon", "Marseilles", "Bordeaux", "Deauville", "Lille"]
format = ["Super Sprint", "Sprint", "Olympic", "Half Ironman", "Ironman"]
starts_at = [DateTime.current, DateTime.current + 1.day, DateTime.current + 1.week, DateTime.current + 1.month]
year = ["2018"]
description = ["Triathlon de Deauville Description"]
url = ["https://triathlondeauville.com/"]
registration_url = ["https://www.njuko.net/tid2018/select_competition"]
available_slots = [1000]
distance_swim = [1.9]
distance_bike = [90]
distance_run = [21.1]
vertical_ascent_bike = [1500]
vertical_ascent_run = [100]

10.times do |race|
  race = Race.new(name:"#{sport.sample} de #{address.sample}", sport: sport.sample, format:format.sample, starts_at: starts_at.sample, address: address.sample, year: year.sample, description: description.sample, url: url.sample, registration_url: registration_url.sample, available_slots: 1000, distance_swim: 1.9, distance_bike: 90, distance_run: 21.1, vertical_ascent_bike: 1500, vertical_ascent_run: 100)
  race.save
  puts "Saving #{race.name}"
end


