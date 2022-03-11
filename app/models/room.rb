class Room < ApplicationRecord
  mount_uploader :image, RoomImageUploader
  validates :name, presence: true
  validates :presence, presence: true
  validates :price, presence: true, numericality: true
  validates :address, presence: true
  validates :image, presence: true
end
