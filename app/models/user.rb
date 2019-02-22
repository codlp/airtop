class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rooftops, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :reservations_as_owner, through: :rooftops, source: :reservations
  mount_uploader :photo, PhotoUploader
end
