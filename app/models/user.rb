class User < ApplicationRecord
    has_many :connect_movies, class_name: 'UserMovie'
    has_many :movies, through: :connect_movies , source: :movie

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

    def food_review(f1)
        # User knows too much about connect_movies and it knows that connect_movies has a relationship called movies
        connect_foods.find_by(food_id: f1.id).review
    end 

    def food_rating(f1)
        connect_foods.find_by(food_id: f1.id).rating
    end

end


 