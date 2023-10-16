class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user 
      log_in @user
      flash[:success] = "Successfully Logged in"
      redirect_to @user
    else 
      flash[:danger] = "Email doesn't exist"
      render_flash
    end 
  end 

  def destroy
    logout
    redirect_to root_path
  end


end
