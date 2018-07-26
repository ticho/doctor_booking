require 'faker'

# create 5 cities
5.times do
  City.create(name: Faker::GameOfThrones.city)
end

# create 10 patients
10.times do
  Patient.create(first_name: Faker::Name.first_name,
                 last_name: Faker::Name.last_name,
                 city_id: City.all.sample.id)
end

# create 10 doctors
10.times do
  Doctor.create(first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                postal_code: rand(0..99_999).to_s.rjust(5, '0'),
                city_id: City.all.sample.id)
end

# create the speciaties table
specialties = ['Surgery', 'Psychiatry', 'Pediatry', 'Oncology', 'Neurology']
specialties.each do |specialty|
  Specialty.create(name: specialty)
end

# give each doctor at least one specialty
Doctor.all.each do |doctor|
  doctor.specialties.push(Specialty.all.sample)
  doctor.save
end

# and give each specialty at least one doctor
Specialty.all.each do |specialty|
  specialty.doctors.push(Doctor.all.sample)
  specialty.save
end


# create 15 appointments, each of them with a doctor and a patient
15.times do
  patient = Patient.all.sample
  doctor = patient.city.doctors.sample
  city = patient.city
  Appointment.create(date: Faker::Date.forward(rand(30)),
                     patient_id: patient.id,
                     doctor_id: doctor.id,
                     city_id: city.id)
end
