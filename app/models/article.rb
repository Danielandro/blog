class Article < ApplicationRecord
  # each article has many comments
  has_many :comments 
  # all articles must have a title >= 5 characters
  validates :title, presence: true,
                    length: { minimum: 5 }
end
