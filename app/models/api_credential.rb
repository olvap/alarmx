class ApiCredential < ApplicationRecord
  belongs_to :user
  validates :token, uniqueness: true
  after_initialize :generate_keys

  private

  def generate_keys
    self.token ||= SecureRandom.hex(32)
  end
end
