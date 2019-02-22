class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :rooftop
  has_many :messages, dependent: :destroy
  has_many :messages_as_owner, through: :rooftops, source: :messages
end
