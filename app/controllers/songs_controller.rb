class SongsController < ApplicationController

  def new
    @song = Song.new
  end

  def index
    if params[:search].present?
      @songs = Song.search(search_arg: params[:search],:page_arg => params[:page], page_count: 4)
    else 
      @songs = Song.paginate(:page => params[:page], :per_page => 4)
    end 
   initialize_user_songs
    if params[:user_id]
      render 'songs/user', id: 2
    end 


  end 

  def show 
    @song = Song.find(params[:id])
  end 

  def change_rating
  end 

  def create
     @song = Song.new(song_create_params)
     if @song.save
       flash.now[:success] = "Song saved to Database successfully"
       redirect_to user_songs_url(current_user)
     end 

  end 

  def destroy
    current_user.connect_songs.find_by(song_id: params[:id]).destroy
    @song = Song.find(params[:id])
    initialize_user_songs
    respond_to do |format|
      format.html { redirect_to user_songs_path(current_user) }
      format.js   {
        render 'songs/liked'
      }
    end 
  end 

  def liked
    current_user.connect_songs.get_or_create(id: params[:id]).mark_as_liked! 
    initialize_user_songs
    @song = Song.find(params[:id])
    flash.now[:success] = "Song added to liked list successfully"
    respond_to do |format|
      format.html { redirect_to user_movies_path(current_user) }
      format.js   {
        render 'songs/liked'
      }
    end 

  end 

  def update
    @song = Song.find(song_update_params[:id])
    respond_to do |format|
      format.html {
        current_user.connect_songs.find_by(song_id: song_update_params[:id]).update(rating: song_update_params[:rating],review: song_update_params[:review])
        redirect_to song_path(@song, liked: true)
      }
      format.js 
    end
  end 

  private 

  def song_create_params
    params.require(:song).permit(:name,:image)
  end 

  def song_update_params
    params.permit(:rating,:review,:id)
  end 

  def initialize_user_songs
    @user = current_user
    @liked_songs = current_user&.connect_songs.liked_songs
  end 

end
