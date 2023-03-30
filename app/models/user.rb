class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :buildings
  has_many :api_credentials
  has_many :sensors

  has_one :setting

  after_create :create_setting

  private

  def create_setting
    self.setting ||= Setting.create(user: self)
  end
end
