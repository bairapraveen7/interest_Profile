class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user&.authenticate(params[:session][:password])
      log_in @user
      params[:session][:remember_me] == '1' && remember(@user)
      flash[:success] = "Successfully Logged in"
      redirect_to @user
    else 
      flash[:danger] = "Email doesn't exist"
      render 'new'
    end 
  end 

  def destroy
    logout
    flash[:success] = "Successfully Logged out"
    redirect_to root_path
  end


end
