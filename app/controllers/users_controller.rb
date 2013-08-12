class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    if logged_in? && current_user.id == params[:id]
      @user = User.find(params[:id])
      render :show
    else
      redirect_to new_session_url
    end
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in(@user)
      flash[:success] = "Welcome to the jungle!!"
      redirect_to @user
    else
      render :new
    end
  end
end
