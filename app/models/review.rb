class Review < ApplicationRecord
  belongs_to :race
  belongs_to :user
  validates :race, uniqueness: { scope: :user }
end
