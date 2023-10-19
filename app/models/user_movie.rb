class UserMovie < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  WATCHED = 0

  # TODO: Write validation to make sure that user_id, movie_id combination is always unique

  def self.watched_movies
    where(status: WATCHED)
  end

  def mark_as_watched!
    update(status: WATCHED)
  end
end
