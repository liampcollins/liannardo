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

u1 = User.create!(name: 'Michael (Heisenberg) Pavling', email: 'heisenberg@gmail.com', password:'password', password_confirmation: 'password', bio:'When Walter White was a graduate student of chemistry at the California Institute of Technology, he conducted research on proton radiography that helped a team win a Nobel Prize in Chemistry. After graduate school, Walter founded the firm Gray Matter Technologies with Geraud Mathe, his former classmate and close friend from Paris, not France! Paris!')

u2 = User.create!(name: 'Geraud Mathe', email: 'gerry@gmail.com', password:'password', password_confirmation: 'password', bio:'Self taught hacker, working with rails, sinatra, mongodb, redis SQL... Geraud, or Gerry as his students call him is most known for his "Top of the Mountain" dance routine, only observed following top-class code, or, past 2am at the Gunmakers.')

u3 = User.create!(name: 'Mike Harris', email: 'mike@gmail.com', password:'password', password_confirmation: 'password', bio:'')
u4 = User.create!(name: 'Mike', email: 'mike@gmail.com', password:'password', password_confirmation: 'password', bio:'')

u5 = User.create!(name: 'Liam', email: 'liamcollins@gmail.com', password:'password', password_confirmation: 'password', bio:'')

u6 = User.create!(name: 'Eduardo', email: 'eduardo@gmail.com', password:'password', password_confirmation: 'password', bio:'')
u7 = User.create!(name: 'Johanna', email: 'johanna@gmail.com', password:'password', password_confirmation: 'password', bio:'')
u8 = User.create!(name: 'Mike', email: 'mike@gmail.com', password:'password', password_confirmation: 'password', bio:'')

u9 = User.create!(name: 'Liam', email: 'liamcollins@gmail.com', password:'password', password_confirmation: 'password', bio:'')

u10 = User.create!(name: 'Eduardo', email: 'eduardo@gmail.com', password:'password', password_confirmation: 'password', bio:'')
u11 = User.create!(name: 'Johanna', email: 'johanna@gmail.com', password:'password', password_confirmation: 'password', bio:'')
u12 = User.create!(name: 'Mike', email: 'mike@gmail.com', password:'password', password_confirmation: 'password', bio:'')

u13 = User.create!(name: 'Liam', email: 'liamcollins@gmail.com', password:'password', password_confirmation: 'password', bio:'')

u14 = User.create!(name: 'Eduardo', email: 'eduardo@gmail.com', password:'password', password_confirmation: 'password', bio:'')
u15 = User.create!(name: 'Johanna', email: 'johanna@gmail.com', password:'password', password_confirmation: 'password', bio:'')
u16 = User.create!(name: 'Mike', email: 'mike@gmail.com', password:'password', password_confirmation: 'password', bio:'')



p1 = Post.create!(content: 'If that’s true, if you don’t know who I am, then maybe your best course… would be to tread lightly.', sentiment: true, sentiment_prob: 75)
p2 = Post.create!(content: 'I am the one who knocks.', sentiment: false, sentiment_prob: 80)

p3 = Post.create!(content: "I'm not feeling well today, I slept like 7 hours last night, its not me man.", sentiment: true, sentiment_prob: 80)
p4 = Post.create!(content: 'BOOOOM!!! GIF: Top of the Mountain!! Guys, let me explain,  Thursday at noon is the Top of the Top of the Mountain..', sentiment: true, sentiment_prob: 70)

p5 = Post.create!(content: ""), sentiment: true, sentiment_prob: 90)
p6 = Post.create!(content: 'need coffee', sentiment: false, sentiment_prob: 55)

p7 = Post.create!(content: 'If that’s true, if you don’t know who I am, then maybe your best course… would be to tread lightly.', sentiment: true, sentiment_prob: 75)
p8 = Post.create!(content: 'I hate cats', sentiment: false, sentiment_prob: 80)

p9 = Post.create!(content: 'I like dogs', sentiment: true, sentiment_prob: 80)
p10 = Post.create!(content: 'Nice weather', sentiment: true, sentiment_prob: 70)

p11 = Post.create!(content: 'having an awesome day', sentiment: true, sentiment_prob: 90)
p12 = Post.create!(content: 'need coffee', sentiment: false, sentiment_prob: 55)

p13 = Post.create!(content: 'If that’s true, if you don’t know who I am, then maybe your best course… would be to tread lightly.', sentiment: true, sentiment_prob: 75)
p14 = Post.create!(content: 'I hate cats', sentiment: false, sentiment_prob: 80)

p15 = Post.create!(content: 'I like dogs', sentiment: true, sentiment_prob: 80)
p16 = Post.create!(content: 'Nice weather', sentiment: true, sentiment_prob: 70)

p17 = Post.create!(content: 'having an awesome day', sentiment: true, sentiment_prob: 90)
p18 = Post.create!(content: 'need coffee', sentiment: false, sentiment_prob: 55)

p19 = Post.create!(content: 'If that’s true, if you don’t know who I am, then maybe your best course… would be to tread lightly.', sentiment: true, sentiment_prob: 75)
p20 = Post.create!(content: 'I hate cats', sentiment: false, sentiment_prob: 80)

p21 = Post.create!(content: 'I like dogs', sentiment: true, sentiment_prob: 80)
p22 = Post.create!(content: 'Nice weather', sentiment: true, sentiment_prob: 70)

p23 = Post.create!(content: 'having an awesome day', sentiment: true, sentiment_prob: 90)
p24 = Post.create!(content: 'need coffee', sentiment: false, sentiment_prob: 55)

p25 = Post.create!(content: 'If that’s true, if you don’t know who I am, then maybe your best course… would be to tread lightly.', sentiment: true, sentiment_prob: 75)
p26 = Post.create!(content: 'I hate cats', sentiment: false, sentiment_prob: 80)

p27 = Post.create!(content: 'I like dogs', sentiment: true, sentiment_prob: 80)
p28 = Post.create!(content: 'Nice weather', sentiment: true, sentiment_prob: 70)

p29 = Post.create!(content: 'having an awesome day', sentiment: true, sentiment_prob: 90)
p30 = Post.create!(content: 'need coffee', sentiment: false, sentiment_prob: 55)

p31 = Post.create!(content: 'If that’s true, if you don’t know who I am, then maybe your best course… would be to tread lightly.', sentiment: true, sentiment_prob: 75)
p32 = Post.create!(content: 'I hate cats', sentiment: false, sentiment_prob: 80)




u1.posts << [p1, p2]
u2.posts << [p3, p4]
u3.posts << [p5, p6]
u4.posts << [p7, p8]
u5.posts << [p9, p10]
u6.posts << [p11, p12]
u7.posts << [p13, p14]
u8.posts << [p15, p16]
u9.posts << [p17, p18]
u10.posts << [p19, p20]
u11.posts << [p21, p22]
u12.posts << [p23, p24]
u13.posts << [p25, p26]
u14.posts << [p27, p28]
u15.posts << [p29, p30]
u16.posts << [p31, p32]








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







