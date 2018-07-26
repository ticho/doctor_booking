# Doctor Booking

## Le pitch

>Tu veux concurrencer Doctolib, donc tu te dis : et si je créais un site qui fait la même chose ? C'est ce que nous allons voir 👩‍⚕️
## Models

## doctors
|Column|Type|
|------|----|
|first_name|string|
|last_name|string|
|specialty|string|
|postal_code|integer|
### Associations
- has_many :patients, through :appointments
- has_many :appointments

## patients
|Column|Type|
|------|----|
|first_name|string|
|last_name|string|
### Associations
- has_many :doctors, through :appointments
- has_many :appointments


## appointments
|Column|Type|
|------|----|
|date|datetime||
|patient_id| reference|
|doctor_id| reference|
### Associations
- belongs_to :patient
- belongs_to :doctor

>Un appointment ne peut avoir qu'un seul doctor, mais un doctor peut avoir plusieurs appointment. Un appointment ne peut avoir qu'un seul patient, mais un patient peut avoir plusieurs appointment. Enfin, un doctor peut avoir plusieurs patient, au travers des appointments, et vice versa.

## Usage

```sh
$ bundle install
$ rails db:migrate
$ rails db:seed
```

## Gems
We use :
- `faker` to populate the database with phony names, emails etc..
