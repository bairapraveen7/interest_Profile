class Timeline < ApplicationRecord
  belongs_to :user
  belongs_to :timelineType, polymorphic: true

  CHANGED_MOVIE_STATUS = 0
  CHANGED_MOVIE_REVIEW = 1
  CHANGED_MOVIE_RATING = 2
  CHANGED_SONG_STATUS = 3
  CHANGED_SONG_REVIEW = 4
  CHANGED_SONG_RATING = 5
  CHANGED_BOOK_STATUS = 6
  CHANGED_BOOK_REVIEW = 7
  CHANGED_BOOK_RATING = 8 
  CHANGED_FOOD_STATUS = 9
  CHANGED_FOOD_REVIEW = 10
  CHANGED_FOOD_RATING = 11

  def self.movie_status(options)
    create(timelineType: options[:timelineType],attributeType: CHANGED_MOVIE_STATUS, attributeValue: options[:attributeValue])
  end 

  def self.movie_review(options)
    create(timelineType: options[:timelineType],attributeType: CHANGED_MOVIE_REVIEW, attributeValue: options[:attributeValue])
  end 

  def self.movie_rating(options)
    create(timelineType: options[:timelineType],attributeType: CHANGED_MOVIE_RATING, attributeValue: options[:attributeValue])
  end 

  def self.song_status(options)
    create(timelineType: options[:timelineType],attributeType: CHANGED_SONG_STATUS, attributeValue: options[:attributeValue])
  end 

  def self.song_review(options)
    create(timelineType: options[:timelineType],attributeType: CHANGED_SONG_REVIEW, attributeValue: options[:attributeValue])
  end 

  def self.song_rating(options)
    create(timelineType: options[:timelineType],attributeType: CHANGED_SONG_RATING, attributeValue: options[:attributeValue])
  end

  def self.book_status(options)
    create(timelineType: options[:timelineType],attributeType: CHANGED_BOOK_STATUS, attributeValue: options[:attributeValue])
  end
  
  def self.book_review(options)
  create(timelineType: options[:timelineType],attributeType: CHANGED_BOOK_REVIEW, attributeValue: options[:attributeValue])
  end 

  def self.book_rating(options)
    create(timelineType: options[:timelineType],attributeType: CHANGED_BOOK_RATING, attributeValue: options[:attributeValue])
  end 

  def self.food_status(options)
    create(timelineType: options[:timelineType],attributeType: CHANGED_FOOD_STATUS, attributeValue: options[:attributeValue])
  end 

  def self.food_review(options)
    create(timelineType: options[:timelineType],attributeType: CHANGED_FOOD_REVIEW, attributeValue: options[:attributeValue])
  end 

  def self.food_rating(options)
    create(timelineType: options[:timelineType],attributeType: CHANGED_FOOD_RATING, attributeValue: options[:attributeValue])
  end 

  def self.my_feed(user)  
    where("user_id IN (#{user.active_relationships.followed_ids})", user_id: user.id)
  end 



end
