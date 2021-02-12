class Tenant < ApplicationRecord
  belongs_to :user
  has_many :receipts

  # scope :user, -> { where(user: current_user.id) }
  validates :name, :address, :rent, :charges, presence: true
end
