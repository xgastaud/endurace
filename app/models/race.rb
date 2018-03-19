class Race < ApplicationRecord
  has_many :participations, dependent: :destroy
end
