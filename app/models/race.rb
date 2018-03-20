class Race < ApplicationRecord
  has_many :participations, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
