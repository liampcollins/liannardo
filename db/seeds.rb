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

u2 = User.create!(name: 'Eduardo', email: 'eduardo@gmail.com', password:'password', password_confirmation: 'password', image:'https://media.licdn.com/mpr/mpr/wc_200_200/p/5/005/062/2f7/3ad9914.jpg' , bio:'I have a cute kitten')
u2 = User.create!(name: 'Johanna', email: 'johanna@gmail.com', password:'password', password_confirmation: 'password', image:'https://media.licdn.com/mpr/mpr/wc_200_200/p/1/005/03c/3a6/18912f3.jpg' , bio:'purely awesome')

p1 = Post.create!(content: 'I like boats')
p2 = Post.create!(content: 'I hate cats')
p3 = Post.create!(content: 'I like dogs')
p4 = Post.create!(content: 'Nice weather')
p5 = Post.create!(content: 'having an awesome day')
p6 = Post.create!(content: 'need coffee')

u1.posts << [p1, p2]
u2.posts << [p3, p4]
u3.posts << [p5, p6]
u1.users << [u2, u3]
u2.users << [u1, u3]
u3.users << [u2, u1]