class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  # def self.find_rand
  #   # total_merchants = Merchant.all.count - 1
  #   array_for_sampling = Array.new
  #   Merchant.all.each do |merchant|
  #     array_for_sampling << merchant.id
  #   end
  #   Merchant.find(array_for_sampling.sample)
  # end
# SELECT floor(random()*(25-10+1))+10;
#Model.order('RANDOM()').first
# self.order('RANDOM()').first

  def self.find_with_order(id)
    items = Merchant.find(id).items
    items.order(:id)
  end

  def self.top_merchant(limiting_qty)
    joins(invoices: [:invoice_items, :transactions]).
      select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) as revenue").
      group(:id).
      merge(Transaction.successful).
      order("revenue desc").
      limit(limiting_qty)
  end
end 
