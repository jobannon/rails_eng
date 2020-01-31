require "rails_helper"

RSpec.describe "Merchants API relationships" do 
  it "sends a list of items for a given merchant relationship" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    merchant_2 = Merchant.create!(name: "Sallys Superstore")
    item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
    item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
    item_3 = merchant_2.items.create!(name: "shampoo", description: "yep, its shampoo", unit_price: 1)

    get "/api/v1/merchants/#{merchant_1.id}/items"

    items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(items["data"].first["attributes"]["name"]).to eq("toothbrush")
    expect(items["data"].first["attributes"]["description"]).to eq("yep, its a toothbrush")
    expect(items["data"].first["attributes"]["unit_price"]).to eq(100)

    expect(items["data"].count).to eq(2)
  end

  it "returns a list of invoices for a merchant" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    merchant_2 = Merchant.create!(name: "Sallys Superstore")
    merchant_3 = Merchant.create!(name: "Joes Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    invoice_2 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    invoice_3 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")

    get "/api/v1/merchants/#{merchant_1.id}/invoices"

    expect(response).to be_successful

    merchant_invoices = JSON.parse(response.body)

    expect(merchant_invoices["data"].count).to eq(3)
    expect(merchant_invoices["data"][0]["id"]).to eq((merchant_1.invoices[0].id).to_s) 
    expect(merchant_invoices["data"][1]["id"]).to eq((merchant_1.invoices[1].id).to_s)
    expect(merchant_invoices["data"][2]["id"]).to eq((merchant_1.invoices[2].id).to_s)
  end
end
