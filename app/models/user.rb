class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :buildings
  has_many :api_credentials
  has_many :emitters, through: :buildings
  has_many :sensors, through: :emitters

  belongs_to :setting

  after_initialize :create_setting

  def admin?
    email == 'oldani.pablo@gmail.com'
  end

  private

  def create_setting
    self.setting ||= Setting.create
  end
end
