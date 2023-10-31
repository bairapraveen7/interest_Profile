class CommentsController < ApplicationController
  def new
    @comment = @commentable.comments.new
  end

  def create

    if params[:movie_id]
      current_user.comments.create(commentable: Movie.find(comment_create_params[:movie_id]), content: comment_create_params[:content])
      @commentable = Movie.find(comment_create_params[:movie_id])
      @class = "user_movie_#{@commentable.id}_comments"
    elsif params[:song_id]
      current_user.comments.create(commentable: Song.find(comment_create_params[:song_id]), content: comment_create_params[:content])
      @commentable = Song.find(comment_create_params[:song_id])
      @class = "user_song_#{@commentable.id}_comments"
    elsif params[:food_id]
      current_user.comments.create(commentable: Food.find(comment_create_params[:food_id]), content: comment_create_params[:content])
      @commentable = Food.find(comment_create_params[:food_id])
      @class = "user_food_#{@commentable.id}_comments"
    elsif params[:book_id]
      current_user.comments.create(commentable: Book.find(comment_create_params[:book_id]), content: comment_create_params[:content])
      @commentable = Book.find(comment_create_params[:book_id])
      @class = "user_book_#{@commentable.id}_comments"
    end 
    
    respond_to do |format|
      format.html {  }
      format.js   
    end


  end

  def edit
    @comment =  Comment.find(params[:id])
    @user = User.find(params[:user_id])
    @commentable = @comment.map_commentable.find(params[@comment.map_commetable_id])
    respond_to do |format| 
      format.html {}
      format.js 
    end 
  end 

  def update 
    Comment.find_by(id: params[:id]).update(content: comment_update_params[:content])
    @user = User.find(comment_update_params[:user_id])
    @comment = Comment.find(comment_update_params[:id])
    @commentable = @comment.map_commentable.find(comment_update_params[@comment.map_commetable_id])
    respond_to do |format|
      format.html {}
      format.js
    end 
  end 

  private 

  def comment_create_params
    params.permit(:movie_id,:song_id,:book_id,:food_id,:content)
  end

  def comment_update_params
    params.permit(:user_id,:movie_id,:id,:song_id,:book_id,:food_id,:content)
  end 

end
