class Relationship < ApplicationRecord
    belongs_to :follower, class_name: "User"
    belongs_to :followed, class_name: "User"

    MOVIE = "Movie"
    SONG = "Song"
    BOOK = "Book"
    FOOD = "Food"

    def self.followed_ids
        "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
    end

    def self.follow_by_movie other_user
        create(followed_id: other_user.id,interest: MOVIE)
    end
    
    def self.follow_by_movie? other_user
        !(find_by(followed_id: other_user.id, interest: MOVIE).nil?)
    end 
  
    def self.follow_by_music other_user
        create(followed_id: other_user.id,interest: MUSIC)
    end 

    def self.follow_by_music? other_user
        !(find_by(followed_id: other_user.id, interest: MUSIC).nil?)
    end

    def self.follow_by_food other_user
        create(followed_id: other_user.cid,interest: BOOK)
    end 

    def self.follow_by_food? other_user
        !(find_by(followed_id: other_user.id, interest: FOOD).nil?)
    end

    def self.follow_by_book other_user
        create(followed_id: other_user.id,interest: FOOD)
    end 

    def self.follow_by_book? other_user
        !(find_by(followed_id: other_user.id, interest: BOOK).nil?)
    end

    def self.unfollow_by_movie other_user
        find_by(followed_id: other_user.id,interest: MOVIE).destroy
    end 

    def self.unfollow_by_music other_user
        find_by(followed_id: other_user.id,interest: MUSIC).destroy
    end 

    def self.unfollow_by_food other_user
        find_by(followed_id: other_user.id,interest: FOOD).destroy
    end 

    def self.unfollow_by_book other_user
        find_by(followed_id: other_user.id,interest: BOOK).destroy
    end 




end
