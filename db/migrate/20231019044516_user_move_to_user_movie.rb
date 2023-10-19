class UserMoveToUserMovie < ActiveRecord::Migration[7.0]
  def change
    rename_table :movie_relationship_user_movies, :user_movies
  end
end
