class Tenant < ApplicationRecord
  belongs_to :user
  has_many :receipts

  # scope :user, -> { where(user: current_user.id) }
end
