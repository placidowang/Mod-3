# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Car.destroy_all
Part.destroy_all
Attachment.destroy_all
PartAttachmentJoiner.destroy_all

c1 = Car.create(make: "Honda", model: "S2000", year: 2006, weight: 2880, base_top_speed: 164, base_acceleration:50, base_handling: 24)
c2 = Car.create(make: "Ford", model: "Mustang", year: 2018, weight: 3600, base_top_speed: 180,base_acceleration:60, base_handling: 34)

p1 = Part.create(name: "engine", car_id: c1.id)
p2 = Part.create(name: "wheels", car_id: c1.id)
p3 = Part.create(name: "rear", car_id: c1.id)
p4 = Part.create(name: "engine", car_id: c2.id)
p5 = Part.create(name: "wheels", car_id: c2.id)
p6 = Part.create(name: "rear", car_id: c2.id)

a1 = Attachment.create(name: "SPOILER", weight: 5, img_url: 'https://image.shutterstock.com/image-photo/car-part-close-detail-custom-260nw-438635593.jpg',change_in_top_speed: -5, change_in_acceleration: -4, change_in_handling: -10)
a2 = Attachment.create(name: "NITRO", weight: 25, img_url: 'https://www.autoguide.com/blog/wp-content/uploads/2012/10/garrett-turbocharger.jpg',change_in_top_speed: 50, change_in_acceleration: 30, change_in_handling: -20)
a3 = Attachment.create(name: "SPIKES", weight: 5, img_url: 'https://images-na.ssl-images-amazon.com/images/I/61O1lvW0NML._AC_SL1400_.jpg',change_in_top_speed: -5, change_in_acceleration: -4, change_in_handling: -10)
a4 = Attachment.create(name: "SPIKES", weight: 5, img_url: 'https://images-na.ssl-images-amazon.com/images/I/61O1lvW0NML._AC_SL1400_.jpg',change_in_top_speed: -5, change_in_acceleration: -4, change_in_handling: -10)
a5 = Attachment.create(name: "STRIPES", weight: 0, img_url: 'https://static1.squarespace.com/static/5a47d2a37131a598444003fc/5a86e91b7de07549b56cc2f3/5a8d9488e2c483e3e3a01610/1519998803109/racing-stripes-mercedes.jpg?format=1500w',change_in_top_speed: 0, change_in_acceleration: 0, change_in_handling:0)

pa1 = PartAttachmentJoiner.create(part_id: p1.id, attachment_id: a1.id)
pa2 = PartAttachmentJoiner.create(part_id: p3.id, attachment_id: a2.id)
pa3 = PartAttachmentJoiner.create(part_id: p6.id, attachment_id: a4.id)
