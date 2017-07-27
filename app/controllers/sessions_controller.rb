class SessionsController < ApplicationController

  def new
  end

  def create
  @current_session = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if @current_session
      session[:user_id] = @current_session.id
      redirect_to books_path
    else
      redirect_to new_session_path
    end
  end

  def destroy
    reset_session
    redirect_to new_session_path
  end

end