class Receipt < ApplicationRecord
  belongs_to :tenant

  validates :date, :period, :tenant, presence: true
end
