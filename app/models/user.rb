class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :api_credentials
  has_many :events
  has_many :sensors

  belongs_to :setting

  after_initialize :create_setting

  def admin?
    email == 'oldani.pablo@gmail.com'
  end

  private

  def create_setting
    self.setting ||= Setting.find_or_initialize_by(user: self)
  end
end
