class Race < ApplicationRecord
  has_many :participations, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  FORMATS_SPORTS = {
    "Triathlon" => ["Ironman", "Longue Distance - Half-Ironman", "Courte Distance - Olympique", "Sprint", "Super Sprint", "Autre"],
    "Running" => ["Marathon", "Semi-marathon", "15km et moins", "Autre"]
    # "Cyclisme" => ["Autre"],
    # "Swimrun" => "Long",
  }

  validates :sport, inclusion: { in: FORMATS_SPORTS.keys, allow_blank: false }
  validate :format_consistent_with_sport

  def format_consistent_with_sport
    if !(FORMATS_SPORTS[self.sport] || []).include?(self.format)
      errors.add(:format, "is not included in the list")
    end
  end
  acts_as_votable
end
