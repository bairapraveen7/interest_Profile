class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :status, presence: true

  READ = 0
  READING = 1
  TO_READ = 2

  BOOK = ->(rel) { rel.book }

  # TODO: Write validation to make sure that user_id, movie_id combination is always unique

  

  def mark_as_read!
    update(status: READ)
  end

  def mark_as_reading!
    update(status: READING)
  end

  def mark_as_to_read!
    update(status: TO_READ)
  end 

  def self.get_or_create(options)
    relation = find_by(book_id: options[:id]) 
    relation ||= create(book_id: options[:id])
  end 

  def self.to_read_books
    where(status: TO_READ).map &BOOK
  end 

  def self.read_books
    where(status: READ).map &BOOK
  end

  def self.reading_books
    where(status: READING).map &BOOK
  end 


end
