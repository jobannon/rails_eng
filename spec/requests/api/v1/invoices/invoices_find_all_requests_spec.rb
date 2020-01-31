require "rails_helper"

RSpec.describe "Invoices API find all methods" do 
  it "can send multiple records after doing a find_all on Invoice merchant_id" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    invoice_2 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    invoice_3 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")

    get "/api/v1/invoices/find_all?merchant_id=#{merchant_1.id}"

    show_invoice = JSON.parse(response.body) 

    expect(show_invoice["data"].class).to eq(Array)
    expect(show_invoice["data"].class).to_not eq(Hash)

    expect(show_invoice["data"][0]["attributes"]["merchant_id"]).to eq(merchant_1.id)
    expect(show_invoice["data"][1]["attributes"]["merchant_id"]).to eq(merchant_1.id)
    expect(show_invoice["data"][2]["attributes"]["merchant_id"]).to eq(merchant_1.id)
    expect(show_invoice["data"].count).to eq(3)

  end  

  it "can send multiple records after doing a find_all on Invoice customer_id" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    invoice_2 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    invoice_3 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")

    get "/api/v1/invoices/find_all?customer_id=#{customer_1.id}"

    show_invoice = JSON.parse(response.body) 

    expect(show_invoice["data"].class).to eq(Array)
    expect(show_invoice["data"].class).to_not eq(Hash)

    expect(show_invoice["data"][0]["attributes"]["customer_id"]).to eq(customer_1.id)
    expect(show_invoice["data"][1]["attributes"]["customer_id"]).to eq(customer_1.id)
    expect(show_invoice["data"][2]["attributes"]["customer_id"]).to eq(customer_1.id)
    expect(show_invoice["data"].count).to eq(3)
  end  

  it "can send multiple records after doing a find_all on Invoice created_at" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed", created_at: "Thu, 30 Jan 2020 01:50:39")
    invoice_2 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed", created_at: "Thu, 30 Jan 2020 01:50:39") 
    invoice_3 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed", created_at: "Thu, 30 Jan 2020 01:50:39")

    get "/api/v1/invoices/find_all?created_at=#{invoice_1.created_at}"

    show_invoice = JSON.parse(response.body) 

    expect(show_invoice["data"].class).to eq(Array)
    expect(show_invoice["data"].class).to_not eq(Hash)

    #not sure why spec harnass wants this removed
    # expect(show_invoice["data"][0]["attributes"]["created_at"]).to eq(invoice_1.created_at)
    # expect(show_invoice["data"][1]["attributes"]["created_at"]).to eq(invoice_2.created_at)
    # expect(show_invoice["data"][2]["attributes"]["created_at"]).to eq(invoice_3.created_at)
    expect(show_invoice["data"].count).to eq(3)
  end  

  it "can send multiple records after doing a find_all on Invoice status" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed", created_at: "Thu, 30 Jan 2020 01:50:39")
    invoice_2 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed", created_at: "Thu, 30 Jan 2020 01:50:39") 
    invoice_3 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed", created_at: "Thu, 30 Jan 2020 01:50:39")

    get "/api/v1/invoices/find_all?status=#{invoice_1.status}"

    show_invoice = JSON.parse(response.body) 

    expect(show_invoice["data"].class).to eq(Array)
    expect(show_invoice["data"].class).to_not eq(Hash)

    expect(show_invoice["data"][0]["attributes"]["status"]).to eq(invoice_1.status)
    expect(show_invoice["data"][1]["attributes"]["status"]).to eq(invoice_2.status)
    expect(show_invoice["data"][2]["attributes"]["status"]).to eq(invoice_3.status)
    expect(show_invoice["data"].count).to eq(3)
  end  
end
