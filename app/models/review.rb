class Review < ApplicationRecord
  belongs_to :restaurant
  validates :rating, :content, presence: true
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5], allow_nil: false }
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 6 }
end
