class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :annoncements

  # Required attributes
  validates :name, :last_name, :phone, presence: true
end