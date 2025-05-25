class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new,:create]

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to habits_path
    else
      flash.now[:alert] = "ユーザー名またはパスワードが違います"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
end
