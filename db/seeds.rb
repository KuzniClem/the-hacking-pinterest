# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Pin.destroy_all
Comment.destroy_all

10.times do
  user = User.new
  first_name = Faker::Name.unique.first_name
  user.first_name = first_name
  user.last_name = Faker::Name.unique.last_name
  user.email = Faker::Internet.unique.safe_email(first_name)
  user.save
end

10.times do
  user = User.all.sample
	pin = Pin.new
	pin.user = user
  pin.url = Faker::Internet.url('example.com')
	pin.save
end

15.times do
  comment = Comment.new
  comment.content = Faker::Lovecraft.paragraph
  comment.user = User.all.sample
  comment.pin = Pin.all.sample
  comment.save
end
