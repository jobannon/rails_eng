require "rails_helper"

RSpec.describe "Invoices API find by methods" do 
  it "can send a single record after finding by id" do
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")

    get "/api/v1/invoices/find?id=#{invoice_1.id}"

    show_invoice = JSON.parse(response.body) 

    expect(show_invoice["data"].class).to eq(Hash)
    expect(show_invoice["data"].class).to_not eq(Array)
    expect(show_invoice["data"]["id"]).to eq(invoice_1.id.to_s)
    
    expect(show_invoice["data"]["attributes"]["merchant_id"]).to eq(invoice_1.merchant_id)
    expect(show_invoice["data"]["attributes"]["customer_id"]).to eq(invoice_1.customer_id)
  end

  it "can send a single record after finding by merchant_id" do
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")

    get "/api/v1/invoices/find?merchant_id=#{invoice_1.merchant_id}"

    show_invoice = JSON.parse(response.body) 

    expect(show_invoice["data"].class).to eq(Hash)
    expect(show_invoice["data"].class).to_not eq(Array)
    expect(show_invoice["data"]["attributes"]["merchant_id"]).to eq(invoice_1.merchant_id)
    expect(show_invoice["data"]["attributes"]["customer_id"]).to eq(invoice_1.customer_id)
  end

  it "can send a single record after finding by customer_id" do
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")

    get "/api/v1/invoices/find?customer_id=#{invoice_1.customer_id}"

    show_invoice = JSON.parse(response.body) 

    expect(show_invoice["data"].class).to eq(Hash)
    expect(show_invoice["data"].class).to_not eq(Array)
    expect(show_invoice["data"]["attributes"]["merchant_id"]).to eq(invoice_1.merchant_id)
    expect(show_invoice["data"]["attributes"]["customer_id"]).to eq(invoice_1.customer_id)
  end
  
  it "can send a single record after finding by status (this will be better done on the find_all below)" do
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")

    get "/api/v1/invoices/find?status=#{invoice_1.status}"

    show_invoice = JSON.parse(response.body) 

    expect(show_invoice["data"].class).to eq(Hash)
    expect(show_invoice["data"].class).to_not eq(Array)
    expect(show_invoice["data"]["attributes"]["merchant_id"]).to eq(invoice_1.merchant_id)
    expect(show_invoice["data"]["attributes"]["customer_id"]).to eq(invoice_1.customer_id)
    expect(show_invoice["data"]["attributes"]["status"]).to eq(invoice_1.status)
  end
#########################################
  it "can send a single record after finding by created_at(this will be better done on the find_all below)" do
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed", created_at: 10/17/1988)

    get "/api/v1/invoices/find?created_at=#{invoice_1.created_at}"

    show_invoice = JSON.parse(response.body) 

    expect(show_invoice["data"].class).to eq(Hash)
    expect(show_invoice["data"].class).to_not eq(Array)
    expect(show_invoice["data"]["attributes"]["merchant_id"]).to eq(invoice_1.merchant_id)
    expect(show_invoice["data"]["attributes"]["customer_id"]).to eq(invoice_1.customer_id)
    expect(show_invoice["data"]["attributes"]["created_at"]).to eq(invoice_1.created_at)
  end

  it "can send a single record after finding by updated_at(this will be better done on the find_all below)" do
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")

    get "/api/v1/invoices/find?updated_at=#{invoice_1.updated_at}"

    show_invoice = JSON.parse(response.body) 

    expect(show_invoice["data"].class).to eq(Hash)
    expect(show_invoice["data"].class).to_not eq(Array)
    expect(show_invoice["data"]["attributes"]["merchant_id"]).to eq(invoice_1.merchant_id)
    expect(show_invoice["data"]["attributes"]["customer_id"]).to eq(invoice_1.customer_id)
    expect(show_invoice["data"]["attributes"]["updated_at"]).to eq(invoice_1.updated_at)
  end
end
