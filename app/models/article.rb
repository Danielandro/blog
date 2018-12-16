class Article < ApplicationRecord
  # each article has many comments
  # destroy all comment when article is deleted
  has_many :comments, dependent: :destroy 
  # all articles must have a title >= 5 characters
  validates :title, presence: true,
                    length: { minimum: 5 }
end
