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
    timelines = Timeline.joins("INNER JOIN (#{user.active_relationships.to_sql}) as relationships ON timelines.user_id = relationships.followed_id AND timelines.timelineType_type = relationships.interest")
  end 

  def self.map_timelineType(timelineType,timelineId)
    result = case timelineType
              when "Movie"
                  Movie.find(timelineId)
              when "Song"
                Song.find(timelineId)
              when "Book"
                  Book.find(timelineId)
              when "Food"
                Food.find(timelineId)
              end 

    return result

  end 

  def self.map_attributeType(attributeType)
    
    result = case attributeType

              when 0
                "Changed Movie Status"
              when 1
                "Changed Movie Review"
              when 2
                "Changed Movie Rating"
              when 3
                "Changed Song Status"
              when 4
                "Changed Song Review"
              when 5
                "Changed Song Rating"
              when 6
                "Changed Book Status"
              when 7
                "Changed Book Review"
              when 8
                "Changed Book Rating"
              when 9
                "Changed Food Status"
              when 10
                "Changed Food Review"
              when 11
                "Changed Food Rating"
              else
                "Unknown"
              end

    return result

  end 


end
