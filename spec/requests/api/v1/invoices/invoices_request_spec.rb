require "rails_helper"

RSpec.describe "resource endpoints" do 
  it "get get record of a single invoice" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
    item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
    item_3 = merchant_1.items.create!(name: "shampoo", description: "yep, its shampoo", unit_price: 1)

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")

    get "/api/v1/invoices/#{invoice_1.id}"
     
    show_invoice = JSON.parse(response.body)

    expect(show_invoice["data"].class).to eq(Hash)
    expect(show_invoice["data"].class).to_not eq(Array)
    expect(show_invoice["data"]["id"]).to eq(invoice_1.id.to_s)
    
    expect(show_invoice["data"]["attributes"]["merchant_id"]).to eq(invoice_1.merchant_id)
    expect(show_invoice["data"]["attributes"]["customer_id"]).to eq(invoice_1.customer_id)
  end

  it "gets a index record of invoices" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
    item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
    item_3 = merchant_1.items.create!(name: "shampoo", description: "yep, its shampoo", unit_price: 1)

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    invoice_2 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    invoice_3 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    invoice_4 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")

    get "/api/v1/invoices/"
     
    index_invoices = JSON.parse(response.body)

    expect(index_invoices["data"].class).to eq(Array)
    expect(index_invoices["data"].class).to_not eq(Hash)
    expect(index_invoices["data"].count). to eq(4)

    
    expect(index_invoices["data"].first["attributes"]["merchant_id"]).to eq(invoice_1.merchant_id)
    expect(index_invoices["data"].first["attributes"]["customer_id"]).to eq(invoice_1.customer_id)
    expect(index_invoices["data"].first["attributes"]["status"]).to eq(invoice_1.status)

  end

end
