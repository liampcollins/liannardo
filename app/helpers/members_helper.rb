module MembersHelper
  def currentUserVotes(post)
    votes = post.votes.select do |vote|
      if vote.user_id == current_user.id
        vote
      end
    end
    binding.pry
    vote
  end


end
