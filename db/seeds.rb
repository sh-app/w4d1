# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
user1 = User.create!(username: "username1")
user2 = User.create!(username: "username2")
user3 = User.create!(username: "username3")
user4 = User.create!(username: "username4")

Contact.destroy_all
contact1 = Contact.create!(name: "peter", email: "pz@gmail.com", user_id: user1.id)
contact2 = Contact.create!(name: "shahriver", email: "shahriver@gmail.com", user_id: user2.id)
contact3 = Contact.create!(name: "user3", email: "user3@gmail.com", user_id: user3.id)
contact4 = Contact.create!(name: "user4", email: "user4@gmail.com", user_id: user4.id)

ContactShare.destroy_all
contactshare1 = ContactShare.create!(user_id: user1.id, contact_id: contact4.id)
contactshare2 = ContactShare.create!(user_id: user2.id, contact_id: contact3.id)
contactshare3 = ContactShare.create!(user_id: user3.id, contact_id: contact2.id)
contactshare4 = ContactShare.create!(user_id: user4.id, contact_id: contact1.id)
