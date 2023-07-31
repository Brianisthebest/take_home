# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

customer_1 = Customer.create(first_name: "Pee-wee", last_name: "Herman", address: "123 Fake St.", email: "email1@email.com")
customer_2 = Customer.create(first_name: "Paul", last_name: "Reubens", address: "235 Fake St.", email: "email2@email.com")


tea_1 = Tea.create(title: "Green Tea", description: "Green tea is not Black tea", temperature: "180", brew_time: "3")
tea_2 = Tea.create(title: "Black Tea", description: "Black tea is not Green tea", temperature: "190", brew_time: "10")
tea_3 = Tea.create(title: "Sweet Tea", description: "Sweet tea is not Black tea or Green tea", temperature: "60", brew_time: "5")

Subscription.create(tea_id: tea_1.id, customer_id: customer_1.id, title: "Green Tea Subscription", price: "15.00", status: "Active", frequency: "Monthly")
Subscription.create(tea_id: tea_2.id, customer_id: customer_1.id, title: "Black Tea Subscription", price: "20.00", status: "Active", frequency: "Weekly")
Subscription.create(tea_id: tea_3.id, customer_id: customer_2.id, title: "Sweet Tea Subscription", price: "25.00", status: "Active", frequency: "Daily(wow)")
Subscription.create(tea_id: tea_2.id, customer_id: customer_2.id, title: "Black Tea Subscription", price: "20.00", status: "Active", frequency: "Monthly")