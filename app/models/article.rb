class Article < ApplicationRecord
  # all articles must have a title >= 5 characters
  validates :title, presence: true,
                    length: { minimum: 5 }
end
