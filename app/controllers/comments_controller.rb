# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :require_login
  def index
    redirect_to comments_path
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    if @comment.save
      redirect_to post_path(@posts)
    else
      render :new
    end
  end

  private

  def comment_params
    if current_user.user? ==  session[:user_id]
      params.require(:user_id).permit(:Title, Text)
    end
  end
end
