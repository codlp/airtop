class Rooftop < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :price_per_hour, numericality: { only_integer: true }
end
