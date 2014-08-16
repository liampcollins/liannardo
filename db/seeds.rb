# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Post.delete_all
# Vote.delete_all

u1 = User.create!(name: 'Liam', email: 'liamcollins@gmail.com', password:'password', password_confirmation: 'password', image:'https://media.licdn.com/mpr/mpr/wc_200_200/p/4/005/025/0a4/16ff8cb.jpg' , bio:'I am Irish')

p1 = Post.create!(content: 'I like boats')
p2 = Post.create!(content: 'I hate cats')

u1.posts << [p1]
u1.posts << [p2]