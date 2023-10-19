class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def index 
    if params[:search].present?
      @movies = Movie.search(search_arg: params[:search],:page_arg => params[:page], page_count: 4)
    else 
      @movies = Movie.paginate(:page => params[:page], :per_page => 4)
    end 
    @user = User.find(params[:user_id])

    @watched_movies = @user.connect_movies.watched_movies
    @watching_movies = @user.connect_movies.watching_movies
    @to_watch_movies = @user.connect_movies.to_watch_movies

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
    @watched_movies = @user.connect_movies.watched_movies
    @watching_movies = @user.connect_movies.watching_movies
    @to_watch_movies = @user.connect_movies.to_watch_movies
  end 

  def watched
    
    connect_movie = current_user.connect_movies.find_by(movie_id: params[:id])
    connect_movie ||= current_user.connect_movies.create(movie_id: params[:id])
    connect_movie.mark_as_watched!

    respond_to do |format|
      format.html { redirect_to user_movie_path(@user) }
      format.js
    end 
    

  end 

  def watching
    connect_movie = current_user.connect_movies.find_by(movie_id: params[:id])
    connect_movie ||= current_user.connect_movies.create(movie_id: params[:id])
    connect_movie.mark_as_watching!

    respond_to do |format|
      format.html { redirect_to user_movie_path(current_user) }
      format.js
    end 

  end 

  def to_watch
    connect_movie = current_user.connect_movies.find_by(movie_id: params[:id])
    connect_movie ||= current_user.connect_movies.create(movie_id: params[:id])
    connect_movie.mark_as_to_watch!

    respond_to do |format|
      format.html { redirect_to user_movie_path(current_user) }
      format.js
    end 

  end 

  private 

  def movie_params
    params.require(:movie).permit(:name,:director)
  end 

end
