# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
admin =  User.create!(email: "iem.saad@hotmail.com", age: 21, cnic: 121121212121212, first_name: "Saad", last_name: "Abdullah", dob: "2021-06-21 00:00:00.000000000 +0000", password: 'password', password_confirmation: 'password')
# INSERT INTO "ROLES" ("ROLE_NUM", "NAME", "CREATED_AT", "UPDATED_AT", "ID") VALUES (:a1, :a2, :a3, :a4, :a5)
 Role.create(role_num: 1, name: 'Admin')
 Role.create(role_num: 2, name: 'Head')
 Role.create(role_num: 3, name: 'Staff')
 Role.create(role_num: 4, name: 'Person')
 AssignedRole.create(user_id: User.first.id, role_id: Role.find_by_role_num(1).id)
 Admin::Vaccine.create(name: 'CanSino', no_of_doses: 1, days_to_sec_dose: 0, amount: 5000000)
 Admin::Vaccine.create(name: 'Sputnik', no_of_doses: 1, days_to_sec_dose: 0, amount: 5000000)
 Admin::Vaccine.create(name: 'SinoFarm', no_of_doses: 2, days_to_sec_dose: 21, amount: 5000000)
 Admin::Vaccine.create(name: 'SinoVac', no_of_doses: 2, days_to_sec_dose: 28, amount: 5000000)

20.times do 
  user =  User.create!(email: Faker::Internet.unique.email, age: 25, cnic: 121121212121212, first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, dob: "2000-06-21 00:00:00.000000000 +0000", password: 'password', password_confirmation: 'password')
  AssignedRole.create(user_id: user.id, role_id: Role.find_by_role_num(4).id)
end

5.times do 
  user =  User.create!(email: Faker::Internet.unique.email, age: 25, cnic: 121121212121212, first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, dob: "2000-06-21 00:00:00.000000000 +0000", password: 'password', password_confirmation: 'password')
  AssignedRole.create(user_id: user.id, role_id: Role.find_by_role_num(2).id)
end
