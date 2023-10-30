class Movie < ApplicationRecord
    has_many :connect_users, class_name: 'UserMovie'
    
    has_many :users, through: :connect_users, source: :user

    has_many :timelines, as: :timelineType

    has_many :comments, as: :commentable
    
    def self.search(options)
        where("LOWER(name) LIKE ? OR LOWER(director) LIKE ?", "%#{options[:search_arg].downcase}%", "%#{options[:search_arg].downcase}%").paginate(page: options[:page_arg], per_page: options[:page_count])
    end 

end
