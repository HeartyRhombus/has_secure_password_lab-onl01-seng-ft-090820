class SessionsController < ApplicationController
  def new
  end

  def create
    # binding.pry
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      # redirect_to user_homepage
    else
      redirect_to 'login'
    end
  end
end
