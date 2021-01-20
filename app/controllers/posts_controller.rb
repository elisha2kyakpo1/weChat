# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :require_login, only: %i[create destroy update]
  before_action :authorize, only: [:destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = User.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      redirect_to posts_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:body, :user_id)
  end
end
