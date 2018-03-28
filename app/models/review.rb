class Review < ApplicationRecord
  belongs_to :race
  belongs_to :user
  validates :race, uniqueness: { scope: :user }
  validates :score, inclusion: {in: 1..5}
end
