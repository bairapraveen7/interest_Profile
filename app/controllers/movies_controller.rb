class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def index 
    if params[:search].present?
      @movies = Movie.where("LOWER(name) LIKE ? OR LOWER(director) LIKE ?", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%").paginate(page: params[:page], per_page: 4)
    else 
      @movies = Movie.paginate(:page => params[:page], :per_page => 4)
    end 
    @user = User.find(params[:user_id])
    @watched_movies = @user.movies.where(user_movies: {status: 0})
    @watching_movies = @user.movies.where( user_movies: {status: 1})
    @to_watch_movies = @user.movies.where(user_movies: {status: 2})
  end 

  def change_rating
  end 

  def create
     @movie = Movie.new(movie_params)
     if @movie.save
       flash[:success] = "Movie saved to Database successfully"
       redirect_to user_movies_url(current_user)
     end 

  end 

  def user 
    @movies = Movie.paginate(:page => params[:page], :per_page => 4)
    @user = User.find(params[:id])
    @watched_user_movies = @user.connect_movies.watched_movies

    @watched_movies = @user.movies.where( user_movies: {status: 0})
    @watching_movies = @user.movies.where( user_movies: {status: 1})
    @to_watch_movies = @user.movies.where( user_movies: {status: 2})
  end 

  def watched
    connect_movie = current_user.connect_movies.find_by(movie_id: params[:id])
    connect_movie ||= current_user.connect_movies.create(movie_id: params[:id])
    connect_movie.mark_as_watched!
    

  end 

  def watching
    relation =  UserMovie.find_by(movie_id: params[:id], user_id: params[:user_id])
    if relation
      relation.update(status: 1)
    else 
       UserMovie.create(movie: Movie.find(params[:id]), user: User.find(params[:user_id]), status: 1)
    end 
  end 

  def to_watch
    relation =  UserMovie.find_by(movie_id: params[:id], user_id: params[:user_id])
    if relation
      relation.update(status: 2)
    else 
      UserMovie.create(movie: Movie.find(params[:id]), user: User.find(params[:user_id]), status: 2)
    end 
  end 

  private 

  def movie_params
    params.require(:movie).permit(:name,:director)
  end 

end
