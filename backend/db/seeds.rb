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

c1 = Car.create(make: "Honda", model: "S2000", year: 2006, weight: 2880, img_url: 'https://cdn-w.v12soft.com/photos/U1ajuAw/12266569/r640_2_800600.jpg')
c2 = Car.create(make: "Ford", model: "Mustang", year: 2018, weight: 3600, img_url: 'https://www.smford.com/inventoryphotos/7440/1fa6p8cf7j5165851/ip/1.jpg?height=400')

p1 = Part.create(name: "engine", car_id: c1.id)
p2 = Part.create(name: "wheels", car_id: c1.id)
p3 = Part.create(name: "rear", car_id: c1.id)
p4 = Part.create(name: "engine", car_id: c2.id)
p5 = Part.create(name: "wheels", car_id: c2.id)
p6 = Part.create(name: "rear", car_id: c2.id)

a1 = Attachment.create(name: "NITRO", weight: 25, img_url: 'https://www.autoguide.com/blog/wp-content/uploads/2012/10/garrett-turbocharger.jpg')
a2 = Attachment.create(name: "SPIKES", weight: 5, img_url: 'https://images-na.ssl-images-amazon.com/images/I/61O1lvW0NML._AC_SL1400_.jpg')
a3 = Attachment.create(name: "SPIKES", weight: 5, img_url: 'https://images-na.ssl-images-amazon.com/images/I/61O1lvW0NML._AC_SL1400_.jpg')
a4 = Attachment.create(name: "STRIPES", weight: 0, img_url: 'https://static1.squarespace.com/static/5a47d2a37131a598444003fc/5a86e91b7de07549b56cc2f3/5a8d9488e2c483e3e3a01610/1519998803109/racing-stripes-mercedes.jpg?format=1500w')

pa1 = PartAttachmentJoiner.create(part_id: p1.id, attachment_id: a1.id)
pa2 = PartAttachmentJoiner.create(part_id: p3.id, attachment_id: a2.id)
pa3 = PartAttachmentJoiner.create(part_id: p6.id, attachment_id: a4.id)
