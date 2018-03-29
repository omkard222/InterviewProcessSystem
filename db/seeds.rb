# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Employee.create!(emp_firstname: "omkar", emp_lastname: "deshmukh", emp_id:"1058", emp_designation:"software engineer",emp_skills:"ROR",emp_mail: "omkard222@gmail.com",emp_phone:"9009009001")

8.times do |n|
  Employee.create(
    emp_firstname: Faker::Name.first_name,
    emp_lastname: Faker::Name.last_name,
    emp_id: Faker::Number.number(4),
    emp_designation: ["Software Engineer","Project Manager","Team Leader"].shuffle.first,
    emp_skills: ["ROR","sap.net","java"].shuffle.first,
    emp_mail: Faker::Internet.email,
    emp_phone: Faker::PhoneNumber.area_code)
  end

  3.times do |n|
    Dutable.create!(
      du_name: ["DU1","DU2","DU3"].shuffle.first,
      du_id_code: Faker::Number.number(3),
      du_description: ["Requirement2018","Requirement2019","Requirement2020"].shuffle.first)
    end

  6.times do |n|
      Project.create!(
        project_name: ["RF","TRILOGY","AMEX","AIRBNB","BIOCLINIC"].shuffle.first,
        pro_idcode: Faker::Number.number(2),
        pro_description: ["finance project","ecommerce project","accounts project"].shuffle.first)
      end
