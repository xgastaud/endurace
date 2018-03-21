class Race < ApplicationRecord
  has_many :participations, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
