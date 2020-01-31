require 'rails_helper'

RSpec.describe "Merchants API Business Intelligence methods" do
  it "returns a list of the top user defined merchants by total revenue(most_revenue=x)" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    merchant_2 = Merchant.create!(name: "Sallys Superstore")
    merchant_3 = Merchant.create!(name: "Joes Superstore")

    item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
    customer_1 = Customer.create!(first_name: "josh", last_name: "tim")
    invoice_1 = Invoice.create!(customer_id: customer_1.id, merchant_id: merchant_1.id, status: "processed")  
    invoice_item_1 = InvoiceItem.create!(invoice_id: invoice_1.id, item_id: item_1.id, quantity: 2, unit_price: 10) 

    item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
    customer_1 = Customer.create!(first_name: "josh", last_name: "tim")
    invoice_1 = Invoice.create!(customer_id: customer_1.id, merchant_id: merchant_1.id, status: "processed")  
    invoice_item_1 = InvoiceItem.create!(invoice_id: invoice_1.id, item_id: item_1.id, quantity: 2, unit_price: 10) 

    item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
    customer_1 = Customer.create!(first_name: "josh", last_name: "tim")
    invoice_2 = Invoice.create!(customer_id: customer_1.id, merchant_id: merchant_1.id, status: "processed")  
    invoice_item_1 = InvoiceItem.create!(invoice_id: invoice_2.id, item_id: item_2.id, quantity: 2, unit_price: 10) 
    

    get '/api/v1/merchants/most_revenue?quantity=1'

    top_two = JSON.parse(response.body)

    expect(response).to be_successful
  end
end

