# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

City.destroy_all
Patient.destroy_all
Specialty.destroy_all
Appointment.destroy_all
Doctor.destroy_all

spec_array= ["Généraliste", "Chirurgien", "Radiologie", "Pédiatrie", "Oncologie", "Cardiologie", 
"Geriatrie", "Urologie", "Gynécologie", "Hématologie", "Neurologie", "Neurochirurgie", "Orthopédie", "Proctologie", "Pneumologie"]

spec_array.each do |spec| #rempli la table specialty
    specialties = Specialty.create(name: spec)
end

50.times do 
    cities = City.create(name: Faker::Address.city) #créer 50 villes
    doctors = Doctor.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        zip_code: Faker::Address.zip_code,
        city: cities #rajoute une ville depuis cities
    )
    patients = Patient.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        city: cities
    )
    doctor_rand = Doctor.all.sample #un doc au hasard
    patient_rand = Patient.all.sample #un PAT au hasard
    #création du RDV
    appointment = Appointment.create(
    doctor: doctor_rand,
    patient: patient_rand, 
    date: Faker::Date.between(from: 15.days.ago, to: Date.today),
    city: cities
    )

    doc_all = Doctor.all#l'ensemble des DOC
    spec_rand = Specialty.all.sample#un SPEC au hasard
    doc_all.each do |doc|#on parcours tous les DOC et on fait associe des specialités
        Jointure.create(doctor: doc, specialty: spec_rand)
    end
end
