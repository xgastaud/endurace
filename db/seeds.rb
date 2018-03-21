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


race1 = Race.new(name:"Triathlon de Deauville", sport:"Triathlon", format:"Triathlon Longue Distance", starts_at:"Sat, 17 Mar 2018 12:00:00 UTC +00:00", address:"Deauville", year:"2018", description:'UNE EPREUVE DE NATATION EN PLEINE MER, SENSATIONS GARANTIES !

Le départ de la natation est donné sur la célèbre plage de sable fin de Deauville, avec ses parasols colorés. Attendez-vous à une température de l’eau variant entre 16 à 20 degrés ainsi qu’à des courants qui vous secouent un peu. A noter que l’épreuve de natation sera lancée à marée haute et qu’une sortie à l’Australienne est prévue, soit une boucle de 950m de nage à réaliser deux fois.

UNE CARTE POSTALE DE LA NORMANDIE, ENTRE TERRE ET MER

Notre parcours cycliste vous permettra de  découvrir les plus beaux paysages de la Normandie : chaumières en toit de chaume, haras, prairies verdoyantes, traversée de 9 villages augerons typiques, vues plongeantes sur la mer …

Mais attention, notre parcours n’a rien d’une balade de santé. La boucle de 42,5km (à réaliser 2 fois) est très technique et tout en relance. La première difficulté arrive très vite après 2km de parcours avec la fameuse côte de Saint-Laurent (15% /de dénivelé sur 1km). La descente vers Saint-Arnoult est ensuite très technique. A peine le temps de récupérer que c’est la longue côte de Reux qui se profile, puis celle de Benerville-sur-Mer avant la plongée finale et le retour vers Deauville par l’hippodrome de Clairefontaine.

UNE EPREUVE SUR LES MYTHIQUES PLANCHES DE DEAUVILLE

Constitué de 4 boucles de 5,250 km, le parcours de course à pied amène les triathlètes sur les légendaires Planches de Deauville qui seront parcourues dans leur globalité. L’arrivée se fera sur l’avenue Lucien Barrière tel des stars !', url:"https://triathlondeauville.com/", registration_url:"https://www.njuko.net/tid2018/select_competition", available_slots:1000, distance_swim:1.9, distance_bike:90, distance_run:21.1, vertical_ascent_bike:1500, vertical_ascent_run:100)
race1.save

race2 = Race.new(name:"Triathlon de Paris", sport:"Triathlon", format:"Triathlon Courte Distance", starts_at: DateTime.current, address:"Tour Eiffel", year:"2018", description:"Triathlon de Deauville Description", url:"https://triathlondeauville.com/", registration_url:"https://www.njuko.net/tid2018/select_competition", available_slots:1000, distance_swim:1.9, distance_bike:90, distance_run:21.1, vertical_ascent_bike:1500, vertical_ascent_run:100)
race2.save

race3 = Race.new(name:"Triathlon de Bourge", sport:"Triathlon", format:"Triathlon Longue Distance", starts_at: DateTime.current, address:"Bourges", year:"2018", description:"Triathlon de Deauville Description", url:"https://triathlondeauville.com/", registration_url:"https://www.njuko.net/tid2018/select_competition", available_slots:1000, distance_swim:1.9, distance_bike:90, distance_run:21.1, vertical_ascent_bike:1500, vertical_ascent_run:100)
race3.save

race4 = Race.new(name:"Triathlon de Rennes", sport:"Triathlon", format:"Triathlon Kids", starts_at: DateTime.current, address:"Rennes", year:"2018", description:"Triathlon de Deauville Description", url:"https://triathlondeauville.com/", registration_url:"https://www.njuko.net/tid2018/select_competition", available_slots:1000, distance_swim:1.9, distance_bike:90, distance_run:21.1, vertical_ascent_bike:1500, vertical_ascent_run:100)
race4.save
