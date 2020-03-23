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

a1 = Attachment.create(name: "Nitro")

pa1 = PartAttachmentJoiner.create(part_id: p1.id, attachment_id: a1.id)