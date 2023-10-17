class MoviesController < ApplicationController
  def new
  end

  def show
    @movies = Movie.paginate(:page => params[:page], :per_page => 4)
    @user = User.find(params[:id])
  end 

  def watched
    MovieRelationship::UserMovie.create(movie: Movie.find(params[:id]), user: User.find(params[:user_id]), status: 0)
  end 

  def watching
    MovieRelationship::UserMovie.create(movie: Movie.find(params[:id]), user: User.find(params[:user_id]), status: 1)
  end 

  def to_watch
    MovieRelationship::UserMovie.create(movie: Movie.find(params[:id]), user: User.find(params[:user_id]), status: 2)
  end 

end
