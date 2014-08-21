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


  def getOriginalPostsIds(users)
    @original_post_ids = []
    @posts.each do |post_record|
      users.each do |user| 
        if post_record.user_id == user.id
          if post_record.repost_id == nil
          @original_post_ids.push(post_record.id)
          end
        end
      end
    end
    @original_post_ids
  end


  def getRepostIds(users)
    @repost_ids = []
    @posts.each do |post_record|
      users.each do |user| 
        if post_record.user_id == user.id
          if post_record.repost_id
          @repost_ids.push(post_record.repost_id)
          end
        end
      end
    end
    @repost_ids
  end
end





