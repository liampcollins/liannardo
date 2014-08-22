class PostsController < ApplicationController
  before_filter :authenticate_user!

# GET /posts
  # GET /posts.json
  # def index
  #   @posts = Post.all

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @posts }
  #   end
  # end

  # GET /posts/1
  # GET /posts/1.json

  # def index
  
  #   @q = Post.search(params[:p])
  #   @posts = @q.result

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @posts }
  #   end
  # end


  def index

    

    @q = Post.search(params[:q])
    @posts = @q.result(distinct: true)
    # @posts.order("created_at DESC")
    # @posts.order{ |k| k["id"] }


    last_post = Post.last
    if last_post.user.users.include?(current_user)
      if Time.now - Post.last.created_at < 3 
        @count = 1
      else
        @count = 0
      end
    else
      @count = 0
    end

    
    # @p = User.search(params[:p])
    # @users = @p.result(distinct: true)
    respond_to do |format|
      format.html # index.html.erb
      if @count>0
      format.json { render :json => @posts}
      else
      format.json { render :json => @count}
      end
    end
  end


  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit

    @post = Post.find(params[:id])


  end

  # POST /posts
  # POST /posts.json
  def create
    if params[:post][:repost_id]
      #Adding if clicking repost, deleting if unclicking repost
      repost_id = (params[:post][:repost_id]).to_i
      repost_exist = current_user.posts.all.select do |post|
        if post.repost_id == repost_id
           post
        end
      end
      if repost_exist.length > 0
        Post.destroy(repost_exist.first.id)
      else
      @post = Post.new(params[:post])
      @post.user_id = current_user.id
      @post.save
      end
    else
      @post = Post.new(params[:post])
      sentiment_data_json = Sentimentalizer.analyze(params[:post][:content])
      sentiment_data = JSON.parse(sentiment_data_json)
      sentiment_smiley = sentiment_data["sentiment"]
      if sentiment_smiley == ":)"
        @post.sentiment = true
      else
        @post.sentiment = false
      end
      @post.sentiment_prob = sentiment_data["probability"]*100
      @post.user_id = current_user.id
      @post.save
    end
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully created.' }
      format.json { render json: @posts, status: :created, location: @post }
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])


    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
