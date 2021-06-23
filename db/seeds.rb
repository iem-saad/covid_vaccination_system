# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
 user = User.create(email: "iem.saad@hotmail.com", age: 21, cnic: 121121212121212, first_name: "Saad", last_name: "Abdullah", dob: "2021-06-21 00:00:00.000000000 +0000")
 Admin.create(user_id: user.id)
