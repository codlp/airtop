class Rooftop < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :price_per_hour, numericality: { only_integer: true }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
