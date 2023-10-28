class User < ApplicationRecord
    has_many :connect_movies, class_name: 'UserMovie'
    has_many :movies, through: :connect_movies , source: :movie, dependent: :destroy

    has_many :comments, dependent: :destroy

    has_many :timelines, dependent: :destroy

    attr_accessor :remember_token
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, presence: true
    has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
    has_many :following, through: :active_relationships, source: :followed

    validates :email,presence: true, uniqueness: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}
    validates :password, presence: true, length: { minimum: 6 }

    has_secure_password

    def authenticated?(remember_token)
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end 

    def comment(options)
        comments.find_by(commentable: options[:commentable],id: options[:id])
    end 

    def forget
        update_attribute(:remember_digest,nil)
    end 
    has_many :movies, through: :connect_movies , source: :movie

 
    has_many :connect_songs, class_name: 'UserSong'
    has_many :songs, through: :connect_songs , source: :song
 
    has_many :connect_foods, class_name: 'UserFood'
    has_many :foods, through: :connect_foods , source: :food
 

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
 
    def food_review(f1)
        # User knows too much about connect_movies and it knows that connect_movies has a relationship called movies
        connect_foods.find_by(food_id: f1.id).review
    end 

    def food_rating(f1)
        connect_foods.find_by(food_id: f1.id).rating
    end
 

end


 