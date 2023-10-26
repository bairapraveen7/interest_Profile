class User < ApplicationRecord
    has_many :connect_movies, class_name: 'UserMovie'
    has_many :movies, through: :connect_movies , source: :movie, dependent: :destroy

    has_many :comments, dependent: :destroy

    attr_accessor :remember_token
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, presence: true
    validates :email,presence: true, uniqueness: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}
    validates :password, presence: true, length: { minimum: 6 }

    has_secure_password

    def authenticated?(remember_token)
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end 

    def forget
        update_attribute(:remember_digest,nil)
    end 

    def movie_notes(m1)
        # User knows too much about connect_movies and it knows that connect_movies has a relationship called movies
        connect_movies.find_by(movie_id: m1.id).notes
    end 

    def movie_rating(m1)
        connect_movies.find_by(movie_id: m1.id).rating
    end 

    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(self.remember_token))
    end 

    def self.new_token
        SecureRandom.urlsafe_base64
    end 

    def self.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST: BCrypt::Engine.cost
        BCrypt::Password.create(string,cost: cost)
    end 


end


 