class SessionsController < ApplicationController
  before_action :redirect_to_home, only: [:front, :new]

  def front; end

  def new
  end

  def create
    user = User.find_by(email: params[:email])
               .try(:authenticate, params[:password])

     if user
       session[:user_id] = user.id
     redirect_to home_path
     else
       flash[:error] = "There is something wrong with your username or password"
       redirect_to signin_path
     end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def redirect_to_home
    redirect_to home_path if logged_in?
  end
end
