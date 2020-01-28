class Invoice < ApplicationRecord
  has_many :transactions
  has_many :invoice_items
  has_many :items ,through: :invoice_items #unsure 
  belongs_to :customer
  belongs_to :merchant
end
