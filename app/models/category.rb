class Category < ApplicationRecord
  # ActiveStorage association
  has_one_attached :icon
  has_many :annoncements
end