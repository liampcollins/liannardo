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
    @following = @user.users.include? current_user

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
    binding.pry
    if params[:user][:follow] == 'false'
      @user.users << current_user
    else params[:user][:follow] == 'true'
      @user.users.delete(current_user)
    end

    respond_to do |format|
      
      format.json { render :json => "success" }

    end
  end
end



