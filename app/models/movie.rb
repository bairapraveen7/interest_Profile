class Movie < ApplicationRecord
    has_many :connect_users, class_name: 'MovieRelationship::UserMovie'
    has_many :users, through: :connect_users, source: :user
end
