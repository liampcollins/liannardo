class Post < ActiveRecord::Base
  require 'obscenity/active_model'

  attr_accessible :content, :user_id, :repost_id, :sentiment, :sentiment_prob

  belongs_to :user
  has_many :votes
  has_one :repost, class_name: "Post"


  validates :content,  obscenity: { sanitize: true, replacement: ["Arse","Batask","Bologna","Beeotch","Bullspit","Burn/Burned","Booty","Bum","Bummer","Balderdash","Blangdang","Blankety-blank","Blast/Blasted","Bleep/Bleepin","Bloomin","Blow(s)","Bite(s)","Brat/Bratty","Cheese and Crackers","Cheese and Rice","Cheeses","Cheesitz","Chit","Chafed","Chaps","Crud","Crabcakes","Crabby","Crapola","Crappity","Crimeny","Dastardly","Dipstick","Doggone","Dump truck","Darn/Darnit","Dag Gummit","Dag Nabit","Dang/Dangit","Drat","Eff/Effin","Egad","Flip/Flippin","Fudge","Farging","Fiddle Sticks","Freak/Freaking","Frack/Fracking","Frazzle-rackin","Frig/Friggin","Frick/Fricking","Fragdaggle","Flunkin'","Gobbledygook","Goodness","Good Grief","Good Gravy","Gosh","Garsh","God Bless America","Gul Durnit","Gobb Dash it","Gadzooks","Heck","H-E-double hockey sticks","Hay (what the hay)","Hogwash","Holy Cow","Holy Frijoles","Holy Shibblets","Horse Pucky","Holy Mother","Hockey Puck","Huffy","Hush","Ice hole (farging-ice hole)","Jeez","Jiminy Crickits","Judas Priest","Kawabunga","Lint Licker","Malarkey","Man/Oh Man","Monkey Flunker","Mother of Pearl","Mother Fathers","Mothersmucker","Mother blanker","My Word","Nuckin Futs","OMGsh","Pete's Sake","Piddle","Pluck it","Poo/Poop/Poopy","Peeves/Peeved","Rice cakes","Hopping","Ram Rod","Rackafratz","Rassa-frazzin","Shush","Snassa-frazzin","Sunny Beach","Snit","Snitch","Steaming","Shiatsu","Sheesh","Shitaki mushrooms","Swear to Christmas","Stuff yourself","Shoot","Snap","Shat","Shut The Front Door","Son of a Mother Trucker","Sheesh","Shnikes","Shiznit","Shucks","Son of a Gun","Son of a Mother","Son of a biscuit eater","Sons a' Guns","Sufferin Succotash","Sucks","Stinks","Sunny Beach","Shamalama","Ticked (off)","Tater Sauce","Troll","Tool","What-the","Weenie","Who-ha","Wu-wu","Witch"].sample }

end
