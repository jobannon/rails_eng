class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.find_all(query_hash)
    where(query_hash)
  end

  def self.find_rand
    # total_merchants = Merchant.all.count - 1
    array_for_sampling = Array.new
    Merchant.all.each do |merchant|
      array_for_sampling << merchant.id
    end
    Merchant.find(array_for_sampling.sample)
  end
end 
