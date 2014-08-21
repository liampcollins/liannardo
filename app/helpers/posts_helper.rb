module PostsHelper
  #Calculating the score (likes and hates on posts) for a user
  def user_score(user)
    # binding.pry
    userhates = 0
    user.posts.each do |post|
     hates = post.votes.where(sentiment: false) 
     post_hates_number = hates.length
     userhates += post_hates_number
    end
    userlikes = 0
    user.posts.each do |post|
     likes = post.votes.where(sentiment: true) 
     post_likes_number = likes.length
     userlikes += post_likes_number
    end
    userscore = userlikes -  userhates
    userscore
  end

  def find_reposts(user)
    user_reposts = []
    user.posts.all.each do |post|
      user_reposts.push(post.repost_id)
    end
    user_reposts
  end

  
end
