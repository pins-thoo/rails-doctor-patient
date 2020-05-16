# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Destroying the patients..'
Patient.destroy_all if Rails.env.development?
puts 'Destroying the doctors..'
Doctor.destroy_all if Rails.env.development?

specialty = ["Dermatology", "Emergency Medicine", "Neurology", "Obstetrics & Gynecology", "Pediatrics", "Surgery", "Urology", "Psychiatry", "Diagnostic Radiology"]

puts "Creating patients..."

10.times do
  patient = Patient.create!(
    name: Faker::Name.unique.name,
    age: Faker::Number.within(range: 1..90)
  )
end

puts "Finish creating patients.."

puts ""
puts "Creating doctors..."

10.times do
  doctor = Doctor.create!(
    name: Faker::TvShows::Friends.character,
    specialty: specialty.sample
  )
end

puts "Finishing creating doctors..."
