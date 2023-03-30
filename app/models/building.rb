class Building < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :emitters
  has_many :sensors, through: :emitters
end
