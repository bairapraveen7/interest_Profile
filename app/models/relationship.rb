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
        create(followed_id: other_user.id,interest: SONG)
    end 

    def self.follow_by_music? other_user
        !(find_by(followed_id: other_user.id, interest: SONG).nil?)
    end

    def self.follow_by_food other_user
        create(followed_id: other_user.id,interest: FOOD)
    end 

    def self.follow_by_food? other_user
        !(find_by(followed_id: other_user.id, interest: FOOD).nil?)
    end

    def self.follow_by_book other_user
        create(followed_id: other_user.id,interest: BOOK)
    end 

    def self.follow_by_book? other_user
        !(find_by(followed_id: other_user.id, interest: BOOK).nil?)
    end

    def self.unfollow_by_movie other_user
        find_by(followed_id: other_user.id,interest: MOVIE).destroy
    end 

    def self.unfollow_by_music other_user
        find_by(followed_id: other_user.id,interest: SONG).destroy
    end 

    def self.unfollow_by_food other_user
        find_by(followed_id: other_user.id,interest: FOOD).destroy
    end 

    def self.unfollow_by_book other_user
        find_by(followed_id: other_user.id,interest: BOOK).destroy
    end 

    def self.follow_by_interest?(interest,other_user)
        result = case interest
            when 0
               follow_by_movie? other_user
           
            when 1
                follow_by_music? other_user
         
            when 2
                follow_by_food? other_user
            
            when 3
                follow_by_book? other_user
             
        end 
        result
    end 




end
