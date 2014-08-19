class UsersController < ApplicationController


  def index
  
    @u = User.search(params[:u])
    @users = @u.result

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end



  end



end