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

  def scoreIcon(user)
    score = user_score(user)
    if score>0
      img="https://blogs.glowscotland.org.uk/wl/stniniansps/files/2013/02/star_12.jpg"
    else
      img="http://www.clickforsign.com/cw4/images/product_expanded/Danger-Warning-Trs-052.jpg"
    end
    img
  end

  def findReposts(user)
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

  def userAndFollowing(the_user)
    following = User.all.select do |user|
      is_following = user.users.select do |following|
        if following.id == the_user.id
          following
        end
      end
      if is_following.length > 0
        user
      end
    end
    the_user_and_following = following << the_user
    the_user_and_following
  end

  def includingRetweets(
# Hiding reposts unless you don't follow or are not the original poster
    post_record, original_ids)
    if post_record.repost_id
      unless original_ids.include?(post_record.repost_id)
        post = Post.find(post_record.repost_id)
      end
    else
      post = Post.find(post_record.id)
    end
  post  
  end


  def sentimentIcon(post)
    if post.sentiment == true
      img="https://cdn1.iconfinder.com/data/icons/musthave/256/Positive.png"
    elsif post.sentiment == false
      img="https://cdn1.iconfinder.com/data/icons/musthave/256/Negative.png"
    else
      img="https://cdn2.iconfinder.com/data/icons/picons-essentials/71/smiley_neutral-512.png"
    end
    img
  end

  def ifRP(post_record, post)
    if post_record.repost_id
      rp = "->RT->"
    else
      rp=""
    end
    rp
  end

  def rpFrom(post_record, post)
    if post_record.repost_id
      rp = link_to post.user.name, member_path(post.user)
    else
      rp=""
    end
    rp
  end



def numberOfLikes(post)
  number_of_likes = post.votes.where(sentiment: true).count  
  number_of_likes
end

def numberOfHates(post)
  number_of_hates = post.votes.where(sentiment: false).count  
  number_of_hates
end

def numReposts(post)
  reposts = Post.where(repost_id: post.id).count
  reposts
end

def getImage(user)
  if user.profile_picture == nil
    img = user.image
  else
    img = user.profile_picture
  end
  img
end



end
