# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Client.create(user_id: "1", client: "Astra", amout: "50")
Client.create(user_id: "1",client: "Volvo", amout: "5")

city =  ["Marseille", "Paris", "Lyon", "Saint-Etienne", "Rouen", "Strasbourg"]
code_postal = ["69001", "75001", "13001", "76000", "67000","42000"]
5.times do 

   user =  User.create!(

  email: Faker::Internet.unique.email,
  password: "1234567",
  first_name: Faker::Name.male_first_name,
  birth_last_name: Faker::Name.last_name,
  birth_date: Faker::Date.between(from: '1950-01-01', to: '2001-01-01'),
  use_name: Faker::Book.author,
  pseudonym: Faker::Superhero.name, 
  citizenship: Faker::Demographic.demonym,
  gender: "M", 
  birth_city: city.sample,
  birth_department: Faker::Number.number(digits: 2),
  birth_country: "France", 
  address: Faker::Address.street_address,
  city:  city.sample,
  zipcode: code_postal.sample,
  country: "France",
  spouse_working_in_company: false,
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
  ssn: Faker::Number.number(digits: 15),
  company_name: Faker::Company.name,
  company_address:  Faker::Address.street_address,
  company_city:  city.sample,
  company_zipcode:code_postal.sample,
  company_country: "France",
  start_activity: Faker::Date.between(from: '2021-03-30', to: '2021-06-01'),
  seasonal_activity: Faker::Boolean.boolean,
  itinerant_activity: Faker::Boolean.boolean,
  main_activity_freetext: Faker::Company.industry,
  employee: Faker::Boolean.boolean,
  partner: Faker::Boolean.boolean,
  individual_entrepreneur: true, 
  bic_status: false
)
end 

5.times do 

  user =  User.create!(
    email: Faker::Internet.unique.email,
    password: "1234567",
  first_name: Faker::Name.female_first_name,
  birth_last_name: Faker::Name.last_name,

  birth_date: Faker::Date.between(from: '1950-01-01', to: '2001-01-01'),
  use_name: Faker::Book.author,
  pseudonym: Faker::Superhero.name, 
  citizenship: Faker::Demographic.demonym,
  gender: "M", 
  birth_city:city.sample,
  birth_department: Faker::Number.number(digits: 2),
  birth_country: "France", 
  address: Faker::Address.street_address,
  city:  city.sample,
  zipcode: code_postal.sample,
  country: "France",
  spouse_working_in_company: false,
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
  ssn: Faker::Number.number(digits: 15),
  company_name: Faker::Company.name,
  company_address:  Faker::Address.street_address,
  company_city:  city.sample,
  company_zipcode: code_postal.sample,
  company_country: "France",
  start_activity: Faker::Date.between(from: '2021-03-30', to: '2021-06-01'),
  seasonal_activity: Faker::Boolean.boolean,
  itinerant_activity: Faker::Boolean.boolean,
  main_activity_freetext: Faker::Company.industry,
  employee: Faker::Boolean.boolean,
  partner: Faker::Boolean.boolean,
  individual_entrepreneur: true, 
  bic_status: false
)
end 
