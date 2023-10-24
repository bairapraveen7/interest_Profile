class MoviesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
    @movie = Movie.new
  end

  def index
    if params[:search].present?
      @movies = Movie.search(search_arg: params[:search],:page_arg => params[:page], page_count: 4)
    else 
      @movies = Movie.paginate(:page => params[:page], :per_page => 4)
    end 
   initialize_user_movies
    if params[:user_id]
      render 'movies/user', id: 2
    end 


  end 

  def show 
    @movie = Movie.find(params[:id])
  end 

  def change_rating
  end 

  def create
     @movie = Movie.new(movie_create_params)
     if @movie.save
       flash.now[:success] = "Movie saved to Database successfully"
       redirect_to user_movies_url(current_user)
     end 

  end 

  def watched
    current_user.connect_movies.get_or_create(id: params[:id]).mark_as_watched! 
    initialize_user_movies
    @movie = Movie.find(params[:id])
    flash.now[:success] = "Movie added to watched list successfully"
    respond_to do |format|
      format.html { redirect_to user_movies_path(current_user) }
      format.js   {
        render 'movies/watched'
      }
    end 

  end 

  def watching
    current_user.connect_movies.get_or_create(id: params[:id]).mark_as_watching!
    initialize_user_movies
    @movie = Movie.find(params[:id])
    flash.now[:success] = "Movie added to watching list successfully"
    respond_to do |format|
      format.html { redirect_to user_movies_path(current_user) }
      format.js   {
        render 'movies/watched'
      }
    end 

  end 

  def to_watch
    current_user.connect_movies.get_or_create(id: params[:id]).mark_as_to_watch!
    initialize_user_movies
    @movie = Movie.find(params[:id])
    flash[:success] = "Movie added to to_watch list successfully"
    respond_to do |format|
      format.html { redirect_to user_movies_path(current_user) }
      format.js   {
        render 'movies/watched'
      }
    end 

  end 

  def update
    @movie = Movie.find(movie_update_params[:id])
    respond_to do |format|
      format.html {
        current_user.connect_movies.find_by(movie_id: movie_update_params[:id]).update(rating: movie_update_params[:rating],notes: movie_update_params[:notes])
        redirect_to movie_path(@movie, watched: true)
      }
      format.js 
    end
  end 

  private 

  def movie_create_params
    params.require(:movie).permit(:name,:director)
  end 

  def movie_update_params
    params.permit(:rating,:notes,:id)
  end 

  def initialize_user_movies
    @user = current_user
    @watched_movies = current_user&.connect_movies.watched_movies
    @watching_movies = current_user&.connect_movies.watching_movies
    @to_watch_movies = current_user&.connect_movies.to_watch_movies
  end 

end
