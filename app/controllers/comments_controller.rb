class CommentsController < ApplicationController
  def new
    @comment = @commentable.comments.new
  end

  def create
    if params[:movie_id]
      current_user.comments.create(commentable: Movie.find(comment_params[:movie_id]), content: comment_params[:content])
    end 
    @movie = Movie.find(comment_params[:movie_id])
    respond_to do |format|
      format.html { redirect_to user_movies_path(current_user) }
      format.js   {
        render 'movies/comment'
      }
    end


  end

  private 

  def comment_params
    params.permit(:movie_id,:content)
  end

end
