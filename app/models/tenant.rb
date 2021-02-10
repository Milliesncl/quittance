class Tenant < ApplicationRecord
  belongs_to :owner
  has_many :receipts
end
