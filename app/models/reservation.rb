class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :rooftop
  has_many :messages, dependent: :destroy
end
