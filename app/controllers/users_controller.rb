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

  def movies
    @movies = Movie.paginate(:page => params[:page], :per_page => 4)
    @user = User.find(params[:id])
    @watched_movies = @user.movies.where(movie_relationship_user_movies: {status: 0})
    @watching_movies = @user.movies.where(movie_relationship_user_movies: {status: 1})
    @to_watch_movies = @user.movies.where(movie_relationship_user_movies: {status: 2})
    render 'users/movie_relationship/movies' 
  end 

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name,:email)
  end 

end
