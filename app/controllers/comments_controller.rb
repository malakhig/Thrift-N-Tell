class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_post
	before_action :set_comment, only: [:destroy, :like]



	def create
		@comment = @post.comments.create(comment_params)
		@comment.user = current_user

		if @comment.save
			 CommentNotifier.with(comment: @comment, post: @post).deliver_later(@post.user)
			flash[:notice] = "Comment has been created"
			redirect_to post_path(@post)
		else
			flash[:alert] = "Error! Comment could not be created"
			redirect_to posts_path(@post)
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		 @comment.destroy
		  Rails.cache.delete_matched("notifications:*")
		redirect_to posts_path(@post)
		
	end

	def like
    if current_user.voted_for? @comment
      @comment.unliked_by current_user
    else
      @comment.liked_by current_user
      #CommentLikeNotifier.with(like: current_user, comment: @comment, user: current_user, post: @comment.post).deliver_later(current_user)
  end

  respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.js   # This will look for a corresponding like.js.erb file
    end
  end

	private

	def set_post
		@post = Post.find(params[:post_id])
	end

	  def set_comment
    @comment = @post.comments.find(params[:id])
  end


	def comment_params
		params.require(:comment).permit(:body)
	end
end
