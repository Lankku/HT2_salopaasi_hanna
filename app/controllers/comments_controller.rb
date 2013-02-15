class CommentsController < ApplicationController
  before_filter :signed_in_user

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build(params[:comment])
    @comment.micropost = @micropost
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to :back
    else
      render 'shared/_comment_form'
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end

  private

  def correct_user
    @comment = current_user.microposts.comment.find(params[:id])
    redirect_to root_url if @comment.nil?
  end
  
  
end
