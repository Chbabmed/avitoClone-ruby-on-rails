class Annoncement < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true

  has_many_attached :images
end
