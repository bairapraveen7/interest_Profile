class UserMovie < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :status, presence: true

  WATCHED = 0
  WATCHING = 1
  TO_WATCH = 2

  MOVIE = ->(rel) { rel.movie }

  # TODO: Write validation to make sure that user_id, movie_id combination is always unique

  

  def mark_as_watched!
    update(status: WATCHED)
  end

  def mark_as_watching!
    update(status: WATCHING)
  end

  def mark_as_to_watch!
    update(status: TO_WATCH)
  end 

  def self.get_or_create(options)
    relation = find_by(movie_id: options[:id]) 
    relation ||= create(movie_id: options[:id])
  end 

  def self.to_watch_movies
    where(status: TO_WATCH).map &MOVIE
  end 

  def self.watched_movies
    where(status: WATCHED).map &MOVIE
  end

  def self.watching_movies
    where(status: WATCHING).map &MOVIE
  end 



end
