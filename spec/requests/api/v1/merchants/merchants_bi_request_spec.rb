require 'rails_helper'

RSpec.describe "Merchants API Business Intelligence methods" do
  it "returns a list of the top user defined merchants by total revenue(most_revenue=x)" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    merchant_2 = Merchant.create!(name: "Sallys Superstore")
    merchant_3 = Merchant.create!(name: "Joes Superstore")

    item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 1)
    customer_1 = Customer.create!(first_name: "josh", last_name: "tim")
    invoice_1 = Invoice.create!(customer_id: customer_1.id, merchant_id: merchant_1.id, status: "processed")  
    invoice_item_1 = InvoiceItem.create!(invoice_id: invoice_1.id, item_id: item_1.id, quantity: 2, unit_price: 1000) 
    transaction_1 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "4444.4444.4444", result: "success")

    item_2 = merchant_2.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 1)
    invoice_2 = Invoice.create!(customer_id: customer_1.id, merchant_id: merchant_2.id, status: "processed")  
    invoice_item_2 = InvoiceItem.create!(invoice_id: invoice_2.id, item_id: item_2.id, quantity: 2, unit_price: 1) 
    transaction_2 = Transaction.create!(invoice_id: invoice_2.id, credit_card_number: "4444.4444.4444", result: "success")

    item_3 = merchant_3.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 1)
    invoice_3 = Invoice.create!(customer_id: customer_1.id, merchant_id: merchant_3.id, status: "processed")  
    invoice_item_3 = InvoiceItem.create!(invoice_id: invoice_3.id, item_id: item_3.id, quantity: 2, unit_price: 1) 
    transaction_3 = Transaction.create!(invoice_id: invoice_3.id, credit_card_number: "4444.4444.4444", result: "success")

    get '/api/v1/merchants/most_revenue?quantity=1'

    top_one = JSON.parse(response.body)

    expect(response).to be_successful
    expect(top_one["data"].count).to eq(1)
    expect(top_one["data"].first["id"]).to eq(merchant_1.id.to_s)
  end
end

