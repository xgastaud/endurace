class Race < ApplicationRecord
  has_many :participations, dependent: :destroy
  mount_uploader :photo, PhotoUploader
end
