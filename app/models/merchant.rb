class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.find_all(query_hash)
    where(query_hash)
  end
end 
