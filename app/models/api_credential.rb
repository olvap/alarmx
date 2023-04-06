class ApiCredential < ApplicationRecord
  belongs_to :user
  validates :token, uniqueness: true
  before_create :generate_keys

  private

  def generate_keys
    begin
      self.token ||= SecureRandom.hex(8)
    end while self.class.exists?(token: token)
  end
end
