class Building < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :sensors
end
