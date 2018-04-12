# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Employee.create!(emp_firstname: "omkar", emp_lastname: "deshmukh", emp_id:"1058", emp_designation:"software engineer",emp_skills:"ROR",emp_mail: "omkard222@gmail.com",emp_phone:"9009009001")
#
# 50.times do |n|
#   Employee.create(
#     emp_firstname: Faker::Name.first_name,
#     emp_lastname: Faker::Name.last_name,
#     emp_id: Faker::Number.number(4),
#     emp_designation: ["Software Engineer","Project Manager","Team Leader"].shuffle.first,
#     emp_skills: ["ROR","sap.net","java"].shuffle.first,
#     emp_mail: Faker::Internet.email,
#     emp_phone: Faker::PhoneNumber.area_code)
# end
#
# counter = 0
# 3.times do |n|
#   du = Dutable.create!(
#     du_name: ["DU1","DU2","DU3"][n],
#     du_id_code: Faker::Number.number(3),
#     du_description: ["Requirement2018","Requirement2019","Requirement2020"][n])
#   2.times do |m|
#     pr = du.projects.create!(project_name: ["RF","TRILOGY","AMEX","AIRBNB","BIOCLINIC","RR"][counter],pro_idcode: Faker::Number.number(2),pro_description: ["finance project","ecommerce project","accounts project"].shuffle.first)
#     counter += 1
#     10.times do |m|
#       emp = Employee.all.shuffle.first
#       pr.employees << emp unless pr.employees.ids.include?(emp.id)
#     end
#   end
# end
#
# Requirement.create!(position: "ROR Developer", skills: "ROR", experience: 3, salary: 7, qualification: "BE/BTECH")
#
# 10.times do |n|
#   Requirement.create(
#     position: ["Software Engineer","Project Manager","Team Leader"].shuffle.first,
#     skills: ["ROR","sap.net","java", "Oracle"].shuffle.first,
#     experience: [0, 1, 3, 5, 7].shuffle.first,
#     salary: [3, 5, 6, 7, 10].shuffle.first,
#     qualification: ["BE", "BTECH", "MCA", "BSC-IT"].shuffle.first)
# end
5.times do |n|
  Skill.create(
    name: ["Ruby On Rails","Java","Dot Net", "DBMS", "Front End"]
    status: true)
  end
