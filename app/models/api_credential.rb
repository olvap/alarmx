class ApiCredential < ApplicationRecord
  belongs_to :user
  validates :key, uniqueness: true
  after_initialize :generate_keys

  private

  def generate_keys
    self.key = SecureRandom.hex(16)
    self.secret = SecureRandom.hex(32)
  end
end
