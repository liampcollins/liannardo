class MembersController < ApplicationController
  def index
    @q = Member.search(params[:q])
    if params[:q]
        # raise
    end
    @users = @q.result(distinct: true)
    # @users = Member.all
    # @p = User.search(params[:p])
    # @users = @p.result(distinct: true)


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def edit

    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:user][:user_id])
    #subscribing to user

    follower_exist = @user.users.all.select do |user|
      if user.id == current_user.id
        user
      end  
    end 
    #binding.pry
    if follower_exist.length >0
      @user.users.delete_if{ |user| user[:user_id] == current_user.id }
    else
    @user.users << current_user
    @user.save
    end
    respond_to do |format|
      
      format.json { render :json => "success" }

    end
  end
end



