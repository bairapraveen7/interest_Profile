class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  def map_commentable
    result = case commentable_type
              when "Movie"
                Movie
              when "Song"
                Song
              when "Food"
                Food
              when "Book"
                Book
              end 

    result
  end 

  def map_commetable_id
    result = case commentable_type
    when "Movie"
      :movie_id
    when "Song"
      :song_id
    when "Food"
      :food_id
    when "Book"
      :book_id
    end 

    result
end 

end
