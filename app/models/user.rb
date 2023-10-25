class User < ApplicationRecord
    has_many :connect_movies, class_name: 'UserMovie'
    has_many :movies, through: :connect_movies , source: :movie

    has_many :connect_songs, class_name: 'UserSong'
    has_many :songs, through: :connect_songs , source: :song

    validates :email,presence: true, uniqueness: true

    def movie_notes(m1)
        # User knows too much about connect_movies and it knows that connect_movies has a relationship called movies
        connect_movies.find_by(movie_id: m1.id).notes
    end 

    def movie_rating(m1)
        connect_movies.find_by(movie_id: m1.id).rating
    end 

    def song_review(s1)
        # User knows too much about connect_movies and it knows that connect_movies has a relationship called movies
        connect_songs.find_by(song_id: s1.id).review
    end 

    def song_rating(s1)
        connect_songs.find_by(song_id: s1.id).rating
    end 

end


 