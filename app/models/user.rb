class User < ApplicationRecord
    has_many :connect_movies, class_name: 'MovieRelationship::UserMovie'
    has_many :movies, through: :connect_movies , source: :movie
    validates :email,presence: true, uniqueness: true
end
