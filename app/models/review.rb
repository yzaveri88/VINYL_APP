class Review < ApplicationRecord
  belongs_to :record
  validates :content, length: { minimum: 20 }
end
