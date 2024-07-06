class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy like remove_image]
  before_action :authenticate_user!
 protect_from_forgery unless: -> { request.format.json? }

  # GET /posts or /posts.json
  def index
    @posts = Post.where(["content LIKE ?", "%#{params[:search]}%"]).reverse
    #@posts = Post.order(created_at: :desc)
  end

  # GET /posts/1 or /posts/1.json
  def show
    @comments = @post.comments.order(likes: :asc)
  end

  def like
    if current_user.voted_for? @post
      @post.unliked_by current_user
    else
      @post.liked_by current_user
      LikeNotifier.with(like: current_user, post: @post, user: current_user).deliver_later(@post.user)
  end

  respond_to do |format|
    format.html { redirect_to(posts_path) }
    format.js   # Ensure this is present for JavaScript response
  end
end
 


  # GET /posts/new
  def new
    @post = Post.new
    @thrifts = Thrift.all 
  end

  # GET /posts/1/edit
  def edit
     @thrifts = Thrift.all
  end

  def your_finds
    @posts = @user.posts.all if @user
  end
  

  # POST /posts or /posts.json
 def create
  @post = Post.new(post_params) do |post|
    post.user = current_user
        post.thrift_id = Thrift.find_by(store: post_params[:location]).id

  end
  if @post.save
    redirect_to posts_path
  else
    redirect_to root_path, notice: @post.errors.full_messages.first
  end
end

  # PATCH/PUT /posts/1 or /posts/1.json
    def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def remove_image
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge_later
    redirect_back(fallback_location: request.referer, notice: "Image was successfully removed.")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
     

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:attachment, :content, :user_id, :location, :thrift_id, :size, :purchased, images: [])
    end
end

