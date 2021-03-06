class User < ApplicationRecord
  has_many :tenants, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :address, presence: true

  # scope :tenants -> () { where(user: current_user) }
end
