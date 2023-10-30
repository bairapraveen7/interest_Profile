class User < ApplicationRecord
    has_many :connect_movies, class_name: 'UserMovie'
    has_many :movies, through: :connect_movies , source: :movie, dependent: :destroy

    has_many :comments, dependent: :destroy

    has_many :timelines, dependent: :destroy

    attr_accessor :remember_token
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :name, presence: true

    has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
    has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
    has_many :following, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships, source: :follower
    
    before_save :downcase_email
    validates :email,presence: true, uniqueness: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}
    validates :password, presence: true, length: { minimum: 6 }

    has_secure_password

    def authenticated?(remember_token)
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end 

    def comment(options)
        comments.find_by(commentable: options[:commentable],id: options[:id])
    end 

    def feed 
        Timeline.my_feed(self)
    end 

    def forget
        update_attribute(:remember_digest,nil)
    end 

    def follow(other_user,interest)
        case interest 
            when 0
                 active_relationships.follow_by_movie(other_user)
            when 1
                 active_relationships.follow_by_music(other_user)
            when 2
                 active_relationships.follow_by_food(other_user)
            when 3
                 active_relationships.follow_by_book(other_user)
        end 
    end 

    def unfollow(other_user,interest)
        case interest
            when 0
                active_relationships.unfollow_by_movie(other_user)
            when 1
                active_relationships.unfollow_by_music(other_user)
            when 2
                active_relationships.unfollow_by_food(other_user)
            when 3
                active_relationships.unfollow_by_book(other_user)
        end 
    end 

    def following?(other_user,interest)
        case interest 
            when 0
                active_relationships.follow_by_movie?(other_user)
            when 1
                active_relationships.follow_by_music?(other_user)
            when 2
                active_relationships.follow_by_food?(other_user)
            when 3
                active_relationships.follow_by_book?(other_user)
    end 
    end 

    def movie_notes(m1)
        # User knows too much about connect_movies and it knows that connect_movies has a relationship called movies
        connect_movies.find_by(movie_id: m1.id).notes
    end 

    def movie_rating(m1)
        connect_movies.find_by(movie_id: m1.id).rating
    end  
    
    private 

    def downcase_email
        self.email.downcase
    end 


end


 