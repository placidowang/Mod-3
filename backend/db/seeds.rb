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

c1 = Car.create(make: "Honda", model: "S2000", year: 2006, weight: 2880)

p1 = Part.create(name: "engine", car_id: c1.id)
p2 = Part.create(name: "wheels", car_id: c1.id)

a1 = Attachment.create(name: "NITRO", weight: 25, img_url: 'https://www.autoguide.com/blog/wp-content/uploads/2012/10/garrett-turbocharger.jpg')
a2 = Attachment.create(name: "SPIKES", weight: 5, img_url: 'https://images-na.ssl-images-amazon.com/images/I/61O1lvW0NML._AC_SL1400_.jpg')

pa1 = PartAttachmentJoiner.create(part_id: p1.id, attachment_id: a1.id)