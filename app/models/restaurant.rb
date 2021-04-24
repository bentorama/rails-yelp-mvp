class Restaurant < ApplicationRecord
  CATEGORIES = %w[chinese italian japanese french belgian]
  has_many :reviews, dependent: :destroy
  validates :category, inclusion: { in: CATEGORIES,
                                    message: '%{value} is not a valid category' }
  validates :address, :name, :category, presence: true
end
