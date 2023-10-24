class UserFood < ApplicationRecord
  belongs_to :user
  belongs_to :food
  validates :status, presence: true

  ATE = 0
  TO_EAT = 2

  FOOD = ->(rel) { rel.food }

  # TODO: Write validation to make sure that user_id, movie_id combination is always unique

  

  def mark_as_ate!
    update(status: ATE)
  end

  def mark_as_to_eat!
    update(status: TO_EAT)
  end 

  def self.get_or_create(options)
    relation = find_by(food_id: options[:id]) 
    relation ||= create(food_id: options[:id])
  end 

  def self.to_eat_foods
    where(status: TO_EAT).map &FOOD
  end 

  def self.ate_foods
    where(status: ATE).map &FOOD
  end

end

