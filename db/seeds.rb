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

u3 = User.create!(name: 'Mathilda Thompson', email: 'mathilda@gmail.com', password:'password', password_confirmation: 'password', bio:'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In id fringilla nisi. Curabitur nisi lacus, suscipit quis mauris ac, aliquam suscipit ipsum. Pellentesque dui tortor, rhoncus eget cursus vel, porta vel enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed dapibus tincidunt nisl sodales fermentum. Nam quis ligula sit amet eros venenatis porta at a orci. ')

u4 = User.create!(name: 'Mike Harris', email: 'mike@gmail.com', password:'password', password_confirmation: 'password', bio:'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In id fringilla nisi. Curabitur nisi lacus, suscipit quis mauris ac, aliquam suscipit ipsum. Pellentesque dui tortor, rhoncus eget cursus vel, porta vel enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed dapibus tincidunt nisl sodales fermentum. Nam quis ligula sit amet eros venenatis porta at a orci.')

u5 = User.create!(name: 'Jarkyn Soltobaeva', email: 'jarkyn@gmail.com', password:'password', password_confirmation: 'password', bio:'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In id fringilla nisi. Curabitur nisi lacus, suscipit quis mauris ac, aliquam suscipit ipsum. Pellentesque dui tortor, rhoncus eget cursus vel, porta vel enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed dapibus tincidunt nisl sodales fermentum. Nam quis ligula sit amet eros venenatis porta at a orci. ')

u6 = User.create!(name: 'Julien Deslangles-Blanch', email: 'julien@gmail.com', password:'password', password_confirmation: 'password', bio:'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In id fringilla nisi. Curabitur nisi lacus, suscipit quis mauris ac, aliquam suscipit ipsum. Pellentesque dui tortor, rhoncus eget cursus vel, porta vel enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed dapibus tincidunt nisl sodales fermentum. Nam quis ligula sit amet eros venenatis porta at a orci. ')

u7 = User.create!(name: 'Johanna Carlberg', email: 'johanna@gmail.com', password:'password', password_confirmation: 'password', bio:'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In id fringilla nisi. Curabitur nisi lacus, suscipit quis mauris ac, aliquam suscipit ipsum. Pellentesque dui tortor, rhoncus eget cursus vel, porta vel enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed dapibus tincidunt nisl sodales fermentum. Nam quis ligula sit amet eros venenatis porta at a orci.')

u8 = User.create!(name: 'Toby Merlet', email: 'toby@gmail.com', password:'password', password_confirmation: 'password', bio:'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In id fringilla nisi. Curabitur nisi lacus, suscipit quis mauris ac, aliquam suscipit ipsum. Pellentesque dui tortor, rhoncus eget cursus vel, porta vel enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed dapibus tincidunt nisl sodales fermentum. Nam quis ligula sit amet eros venenatis porta at a orci. ')

u9 = User.create!(name: 'Liam Collins', email: 'liam@gmail.com', password:'password', password_confirmation: 'password', bio:'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In id fringilla nisi. Curabitur nisi lacus, suscipit quis mauris ac, aliquam suscipit ipsum. Pellentesque dui tortor, rhoncus eget cursus vel, porta vel enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed dapibus tincidunt nisl sodales fermentum. Nam quis ligula sit amet eros venenatis porta at a orci. ')

u10 = User.create!(name: 'Tobias Hale', email: 'tobias@gmail.com', password:'password', password_confirmation: 'password', bio:'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In id fringilla nisi. Curabitur nisi lacus, suscipit quis mauris ac, aliquam suscipit ipsum. Pellentesque dui tortor, rhoncus eget cursus vel, porta vel enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed dapibus tincidunt nisl sodales fermentum. Nam quis ligula sit amet eros venenatis porta at a orci. ')

u11 = User.create!(name: 'Graham Curl', email: 'graham@gmail.com', password:'password', password_confirmation: 'password', bio:'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In id fringilla nisi. Curabitur nisi lacus, suscipit quis mauris ac, aliquam suscipit ipsum. Pellentesque dui tortor, rhoncus eget cursus vel, porta vel enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed dapibus tincidunt nisl sodales fermentum. Nam quis ligula sit amet eros venenatis porta at a orci. ')

u12 = User.create!(name: 'Gwen Au', email: 'gwen@gmail.com', password:'password', password_confirmation: 'password', bio:'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In id fringilla nisi. Curabitur nisi lacus, suscipit quis mauris ac, aliquam suscipit ipsum. Pellentesque dui tortor, rhoncus eget cursus vel, porta vel enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed dapibus tincidunt nisl sodales fermentum. Nam quis ligula sit amet eros venenatis porta at a orci. ')

u13 = User.create!(name: 'Tom Walker', email: 'tom@gmail.com', password:'password', password_confirmation: 'password', bio:'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In id fringilla nisi. Curabitur nisi lacus, suscipit quis mauris ac, aliquam suscipit ipsum. Pellentesque dui tortor, rhoncus eget cursus vel, porta vel enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed dapibus tincidunt nisl sodales fermentum. Nam quis ligula sit amet eros venenatis porta at a orci. ')

u14 = User.create!(name: 'Sam Maton', email: 'sam@gmail.com', password:'password', password_confirmation: 'password', bio:'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In id fringilla nisi. Curabitur nisi lacus, suscipit quis mauris ac, aliquam suscipit ipsum. Pellentesque dui tortor, rhoncus eget cursus vel, porta vel enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed dapibus tincidunt nisl sodales fermentum. Nam quis ligula sit amet eros venenatis porta at a orci. ')

u15 = User.create!(name: 'David Rees', email: 'david@gmail.com', password:'password', password_confirmation: 'password', bio:'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In id fringilla nisi. Curabitur nisi lacus, suscipit quis mauris ac, aliquam suscipit ipsum. Pellentesque dui tortor, rhoncus eget cursus vel, porta vel enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed dapibus tincidunt nisl sodales fermentum. Nam quis ligula sit amet eros venenatis porta at a orci. ')

u16 = User.create!(name: 'Gareth Lee', email: 'gareth@gmail.com', password:'password', password_confirmation: 'password', bio:'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In id fringilla nisi. Curabitur nisi lacus, suscipit quis mauris ac, aliquam suscipit ipsum. Pellentesque dui tortor, rhoncus eget cursus vel, porta vel enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed dapibus tincidunt nisl sodales fermentum. Nam quis ligula sit amet eros venenatis porta at a orci. ')



p1 = Post.create!(content: 'If that’s true, if you don’t know who I am, then maybe your best course… would be to tread lightly.', sentiment: true, sentiment_prob: 75)
p2 = Post.create!(content: 'I am the one who knocks.', sentiment: false, sentiment_prob: 80)

p3 = Post.create!(content: "I'm not feeling well today, I slept like 7 hours last night, its not me man.", sentiment: true, sentiment_prob: 80)
p4 = Post.create!(content: 'BOOOOM!!! GIF: Top of the Mountain!! Guys, let me explain,  Thursday at noon is the Top of the Top of the Mountain..', sentiment: true, sentiment_prob: 70)

p5 = Post.create!(content: "Today is the 100 annivarsary of the start of the First World War"), sentiment: true, sentiment_prob: 90)
p6 = Post.create!(content: 'Indentation! Indentation! You got to take care of the Indentation!', sentiment: false, sentiment_prob: 55)

p7 = Post.create!(content: 'I hold a Guiness World Record', sentiment: true, sentiment_prob: 75)
p8 = Post.create!(content: 'I love Cambridge!! ', sentiment: false, sentiment_prob: 80)

p9 = Post.create!(content: 'WDI7 is my favorite, but seriously guys shhh they will hear me next door', sentiment: true, sentiment_prob: 80)
p10 = Post.create!(content: 'The CheerUps aka: LIANNARDO best presentation of the day by far!', sentiment: true, sentiment_prob: 70)

p11 = Post.create!(content: 'Everyone alright? It smells like toasted brains here today.', sentiment: true, sentiment_prob: 90)
p12 = Post.create!(content: 'I used to be a french diplomat! No, seriously!', sentiment: false, sentiment_prob: 55)

p13 = Post.create!(content: 'Best golf player in the world, Tiger Woods!', sentiment: true, sentiment_prob: 75)
p14 = Post.create!(content: "Don't skin the bear before its been shot", sentiment: false, sentiment_prob: 80)

p15 = Post.create!(content: "In Scotland they say I'm French, and in France that I'm Scotish, important thing is they loved my accent when I went to Mexicoo!!", sentiment: true, sentiment_prob: 80)
p16 = Post.create!(content: 'I was destroyed in table tennis by Eduardo', sentiment: true, sentiment_prob: 70)

p17 = Post.create!(content: 'One tiny <div> destroyed the entire JS, had to start all over!', sentiment: true, sentiment_prob: 90)
p18 = Post.create!(content: 'I like cats', sentiment: false, sentiment_prob: 55)

p19 = Post.create!(content: "I've run into this app called Tinder, look check it out.. that girl is waiting for me in Camden.., I mean I need a place to stay!" , sentiment: true, sentiment_prob: 75)
p20 = Post.create!(content: 'Oooh to, oooh to be, Oooh to, oooh to be, Oooh to, ooh to be, Oooh to be a Goo-ner!', sentiment: false, sentiment_prob: 80)

p21 = Post.create!(content: ' Slash!!!! Its the same thing! ', sentiment: true, sentiment_prob: 80)
p22 = Post.create!(content: "This crazy ***** grabbed my computer on the tube, people have gone mental", sentiment: true, sentiment_prob: 70)

p23 = Post.create!(content: 'Pavling... (hipchat bloopers) ', sentiment: true, sentiment_prob: 90)
p24 = Post.create!(content: 'Laura, Laura... (hipchat bloopers) ', sentiment: false, sentiment_prob: 55)

p25 = Post.create!(content: 'GIF: http://www.gifbin.com/', sentiment: true, sentiment_prob: 75)
p26 = Post.create!(content: 'gif: http://awesomegifs.com/', sentiment: false, sentiment_prob: 80)

p27 = Post.create!(content: 'Will you please pass the Haribo', sentiment: true, sentiment_prob: 80)
p28 = Post.create!(content: "I wonder if I've already secured the 'longest commute' prize for graduation, DAMMIT that's right Tobias travels twice as far to get home", sentiment: true, sentiment_prob: 70)




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







