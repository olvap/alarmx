class Sensor < ApplicationRecord
  validates :mac, presence: true

  belongs_to :building, optional: true
  belongs_to :user, optional: true
end
