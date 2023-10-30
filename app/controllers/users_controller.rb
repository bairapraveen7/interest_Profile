class UsersController < ApplicationController

  

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to user_url(@user)
    end
  end 

  def feed
    @feeds = current_user.feed.paginate(page: params[:page])
  end 

  def following
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end 

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end 

  def index 
    @users = User.all
    render @users
  end 

  def show
    @user = User.find(params[:id])
  end



  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end 

end
