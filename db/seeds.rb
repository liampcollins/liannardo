# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Post.delete_all
Vote.delete_all

u1 = User.create!(name: 'Liam', email: 'liamcollins@gmail.com', password:'password', password_confirmation: 'password', image:'https://media.licdn.com/mpr/mpr/wc_200_200/p/4/005/025/0a4/16ff8cb.jpg' , bio:'I am Irish')

u2 = User.create!(name: 'Eduardo', email: 'eduardo@gmail.com', password:'password', password_confirmation: 'password', image:'https://media.licdn.com/mpr/mpr/wc_200_200/p/5/005/062/2f7/3ad9914.jpg' , bio:'I have a cute kitten')
u3 = User.create!(name: 'Johanna', email: 'johanna@gmail.com', password:'password', password_confirmation: 'password', image:'https://media.licdn.com/mpr/mpr/wc_200_200/p/1/005/03c/3a6/18912f3.jpg' , bio:'purely awesome')
u4 = User.create!(name: 'Mike', email: 'mike@gmail.com', password:'password', password_confirmation: 'password', image:'https://media.licdn.com/mpr/mpr/wc_200_200/p/1/005/03c/3a6/18912f3.jpg' , bio:'I teach code')

p1 = Post.create!(content: 'I like boats', sentiment: true, sentiment_prob: 75)
p2 = Post.create!(content: 'I hate cats', sentiment: false, sentiment_prob: 80)
p3 = Post.create!(content: 'I like dogs', sentiment: true, sentiment_prob: 80)
p4 = Post.create!(content: 'Nice weather', sentiment: true, sentiment_prob: 70)
p5 = Post.create!(content: 'having an awesome day', sentiment: true, sentiment_prob: 90)
p6 = Post.create!(content: 'need coffee', sentiment: false, sentiment_prob: 55)

u1.posts << [p1, p2]
u2.posts << [p3, p4]
u3.posts << [p5, p6]

u1.users << [u2, u3, u4]
u2.users << [u1, u3]
u3.users << [u2, u1]


v1=Vote.create!(sentiment: true)
v2=Vote.create!(sentiment: false)
v3=Vote.create!(sentiment: true)
v4=Vote.create!(sentiment: true)
v5=Vote.create!(sentiment: false)
v6=Vote.create!(sentiment: true)


p1.votes << [v1, v2]
p2.votes <<[v3]
p3.votes << [v4]
p4.votes <<[v5]
p5.votes << [v6]


u1.votes << [v4, v5]
u2.votes <<[v1, v2, v3, v6]







