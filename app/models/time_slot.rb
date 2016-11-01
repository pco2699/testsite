class TimeSlot < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :date_from, presence: true
  validates :date_to, presence: true
end
