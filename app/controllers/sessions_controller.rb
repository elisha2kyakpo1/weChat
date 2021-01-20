class SessionsController < ApplicationController
  def index
    redirect_to root_path
  end

  def new
    # @user = User.new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to posts_path, notice: 'You successfully signed in!'
    else
      render :new, notice: 'Invalid username or password'
    end
  end

  def destroy
    session.delete(:current_user_id)
    @current_user = nil
    redirect_to new_path
  end
end
