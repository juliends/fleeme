# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Service.destroy_all
services_attributes = [
  {
    name: "Carte UGC illimité",
    company: "UGC Ciné Cité",
    street_address: "Service Abonnés",
    zip_code: 92206,
    city: "Neuilly sur Seine Cedex",
    postal_box: "TSA 30 200",
    form_specs: "https://juliendasilva.typeform.com/to/QyqJ49"
  }
]
services_attributes.each { |params| Service.create!(params) }
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')