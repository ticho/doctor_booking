require 'faker'

# create 10 patients
10.times do
  Patient.create(first_name: Faker::Name.first_name,
                 last_name: Faker::Name.last_name)
end

# create 10 doctors
10.times do
  Doctor.create(first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                specialty: Faker::Cannabis.health_benefit,
                postal_code: rand(0..99_999).to_s.rjust(5, '0'))
end

# create 15 appointments, each of them with a doctor and a patient
15.times do
  Appointment.create(date: Faker::Date.forward(rand(30)),
                     patient_id: Patient.all.sample.id,
                     doctor_id: Doctor.all.sample.id)
end
