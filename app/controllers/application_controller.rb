# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def require_login
    if current_user.nil?
      flash[:error] = 'You must be logged in to access this section'
      redirect_to new_session_path
    end
  end

  def current_user
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def authorize
    if current_user.admin?
      redirect_to articles_path, notice: 'Sorry you are not allowed to access this page!'
    end
  end

  helper_method :current_user
end
