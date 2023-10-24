class Food < ApplicationRecord
    has_many :connect_users, class_name: 'UserFood'
    has_many :users, through: :connect_users, source: :user

    def self.search(options)
        where("LOWER(name) LIKE ?", "%#{options[:search_arg].downcase}%").paginate(page: options[:page_arg], per_page: options[:page_count])
    end 
end
