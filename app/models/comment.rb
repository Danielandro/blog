class Comment < ApplicationRecord
  belongs_to :article # setup Active Record association
end
