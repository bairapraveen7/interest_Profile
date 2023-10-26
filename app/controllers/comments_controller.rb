class CommentsController < ApplicationController
  def new
    @comment = @commentable.comments.new
  end

  def create
    if params[:movie_id]
      current_user.comments.create(commentable: Movie.find(comment_create_params[:movie_id]), content: comment_create_params[:content])
    end 
    @movie = Movie.find(comment_create_params[:movie_id])
    respond_to do |format|
      format.html { redirect_to user_movies_path(current_user) }
      format.js   {
        render 'movies/comment'
      }
    end


  end

  def edit
    @user = User.find(params[:user_id])
    @movie = Movie.find(params[:movie_id])
    @comment = @user.comment(commentable: @movie,id: params[:id])
    respond_to do |format| 
      format.html {}
      format.js 
    end 
  end 

  def update 
    Comment.find_by(id: params[:id]).update(content: comment_update_params[:content])
    @user = User.find(comment_update_params[:user_id])
    @movie = Movie.find(comment_update_params[:movie_id])
    @comment = Comment.find(comment_update_params[:id])
    respond_to do |format|
      format.html {}
      format.js
    end 
  end 

  private 

  def comment_create_params
    params.permit(:movie_id,:content)
  end

  def comment_update_params
    params.permit(:user_id,:movie_id,:id,:content)
  end 

end
