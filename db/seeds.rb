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

u1 = User.create!(name: 'Michael (Heisenberg) Pavling', email: 'heisenberg@gmail.com', password:'password', password_confirmation: 'password', bio:'When Walter White was a graduate student of chemistry at the California Institute of Technology, he conducted research on proton radiography that helped a team win a Nobel Prize in Chemistry.')

u2 = User.create!(name: 'Geraud Mathe', email: 'gerry@gmail.com', password:'password', password_confirmation: 'password', bio:'Self taught hacker, working with rails, sinatra, mongodb, redis SQL... Geraud')

u3 = User.create!(name: 'Mike Harris', email: 'mikeharris@gmail.com', password:'password', password_confirmation: 'password', bio:'')
u4 = User.create!(name: 'Mike', email: 'mike@gmail.com', password:'password', password_confirmation: 'password', bio:'')

u5 = User.create!(name: 'Liam', email: 'liamcollins@gmail.com', password:'password', password_confirmation: 'password', bio:'')

u6 = User.create!(name: 'Eduardo', email: 'eduardo@gmail.com', password:'password', password_confirmation: 'password', bio:'')
u7 = User.create!(name: 'Johanna', email: 'johanna@gmail.com', password:'password', password_confirmation: 'password', bio:'')


p1 = Post.create!(content: 'If that’s true, if you don’t know who I am, then maybe your best course… would be to tread lightly.', sentiment: true, sentiment_prob: 75)
p2 = Post.create!(content: 'I am the one who knocks.', sentiment: false, sentiment_prob: 80)

p3 = Post.create!(content: "I'm not feeling well today, I slept like 7 hours last night, its not me man.", sentiment: true, sentiment_prob: 80)
p4 = Post.create!(content: 'BOOOOM!!! GIF: Top of the Mountain!! Guys, let me explain,  Thursday at noon is the Top of the Top of the Mountain..', sentiment: true, sentiment_prob: 70)

p5 = Post.create!(content: "edsedesd", sentiment: true, sentiment_prob: 90)
p6 = Post.create!(content: 'need coffee', sentiment: false, sentiment_prob: 55)

p7 = Post.create!(content: 'If that’s true, if you don’t know who I am, then maybe your best course… would be to tread lightly.', sentiment: true, sentiment_prob: 75)



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







