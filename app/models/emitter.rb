class Emitter < ApplicationRecord
  validates :name, presence: true
  belongs_to :building
  has_many :sensors

  after_initialize :set_token

  private

  def set_token
    self.token ||= SecureRandom.hex(16)
  end
end
