class UserSong < ApplicationRecord
  belongs_to :user
  belongs_to :song

  validates :status, presence: true

  LIKED = 0
   

  SONG = ->(rel) { rel.song }

  # TODO: Write validation to make sure that user_id, movie_id combination is always unique

  

  def mark_as_liked!
    update(status: LIKED)
  end

  def self.get_or_create(options)
    relation = find_by(song_id: options[:id]) 
    relation ||= create(song_id: options[:id])
  end 

  def self.liked_songs
    where(status: LIKED).map &SONG
  end

   



end
