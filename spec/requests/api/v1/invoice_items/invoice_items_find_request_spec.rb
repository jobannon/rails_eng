require "rails_helper"

RSpec.describe "InvoiceItem API for find" do 
  it "can send a single record after finding by id" do
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
    item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
    item_3 = merchant_1.items.create!(name: "shampoo", description: "yep, its shampoo", unit_price: 1)

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    invoiceitem_1 = InvoiceItem.create(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 1, unit_price: 11)

    get "/api/v1/invoice_items/find?id=#{invoiceitem_1.id}"

    show_invoiceitem= JSON.parse(response.body) 

    expect(show_invoiceitem["data"].class).to eq(Hash)
    expect(show_invoiceitem["data"].class).to_not eq(Array)
    expect(show_invoiceitem["data"]["id"]).to eq(invoiceitem_1.id.to_s)
    
    expect(show_invoiceitem["data"]["attributes"]["item_id"]).to eq(invoiceitem_1.item_id)
    expect(show_invoiceitem["data"]["attributes"]["invoice_id"]).to eq(invoiceitem_1.invoice_id)
    expect(show_invoiceitem["data"]["attributes"]["quantity"]).to eq(invoiceitem_1.quantity)
    expect(show_invoiceitem["data"]["attributes"]["unit_price"]).to eq(invoiceitem_1.unit_price)
  end

  it "can send a single record after finding by item_id" do
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
    item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
    item_3 = merchant_1.items.create!(name: "shampoo", description: "yep, its shampoo", unit_price: 1)

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    invoiceitem_1 = InvoiceItem.create(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 1, unit_price: 11)

    get "/api/v1/invoice_items/find?item_id=#{item_1.id}"

    show_invoiceitem = JSON.parse(response.body) 

    expect(show_invoiceitem["data"].class).to eq(Hash)
    expect(show_invoiceitem["data"].class).to_not eq(Array)

    expect(show_invoiceitem["data"]["id"]).to eq(invoiceitem_1.id.to_s)
    expect(show_invoiceitem["data"]["attributes"]["invoice_id"]).to eq(invoiceitem_1.invoice_id)
    expect(show_invoiceitem["data"]["attributes"]["quantity"]).to eq(invoiceitem_1.quantity)
    expect(show_invoiceitem["data"]["attributes"]["unit_price"]).to eq(invoiceitem_1.unit_price)
  end

  it "can send a single record after finding by invoice_id" do
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
    item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
    item_3 = merchant_1.items.create!(name: "shampoo", description: "yep, its shampoo", unit_price: 1)

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    invoiceitem_1 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 1, unit_price: 11)

    get "/api/v1/invoice_items/find?invoice_id=#{invoice_1.id}"

    show_invoiceitem = JSON.parse(response.body) 

    expect(show_invoiceitem["data"].class).to eq(Hash)
    expect(show_invoiceitem["data"].class).to_not eq(Array)

    expect(show_invoiceitem["data"]["id"]).to eq(invoiceitem_1.id.to_s)
    expect(show_invoiceitem["data"]["attributes"]["invoice_id"]).to eq(invoiceitem_1.invoice_id)
    expect(show_invoiceitem["data"]["attributes"]["quantity"]).to eq(invoiceitem_1.quantity)
    expect(show_invoiceitem["data"]["attributes"]["unit_price"]).to eq(invoiceitem_1.unit_price)
  end
  
  it "can send a single record after finding by quantity(this will be better done on the find_all below)" do
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
    item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
    item_3 = merchant_1.items.create!(name: "shampoo", description: "yep, its shampoo", unit_price: 1)

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    invoiceitem_1 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 1, unit_price: 11)
    invoiceitem_2 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 1, unit_price: 11)

    get "/api/v1/invoice_items/find?quantity=#{invoiceitem_1.quantity}"

    show_invoiceitem = JSON.parse(response.body) 

    expect(show_invoiceitem["data"].class).to eq(Hash)
    expect(show_invoiceitem["data"].class).to_not eq(Array)

    expect(show_invoiceitem["data"]["id"]).to eq(invoiceitem_1.id.to_s)
    expect(show_invoiceitem["data"]["attributes"]["invoice_id"]).to eq(invoiceitem_1.invoice_id)
    expect(show_invoiceitem["data"]["attributes"]["quantity"]).to eq(invoiceitem_1.quantity)
    expect(show_invoiceitem["data"]["attributes"]["unit_price"]).to eq(invoiceitem_1.unit_price)
  end

  it "can send a single record after finding by created_at(this will be better done on the find_all below)" do
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
    item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
    item_3 = merchant_1.items.create!(name: "shampoo", description: "yep, its shampoo", unit_price: 1)

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    invoiceitem_1 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 1, unit_price: 11, created_at: "2012-03-10 00:54:09")
    invoiceitem_2 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 1, unit_price: 11, created_at: "2011-03-10 00:54:09")

    get "/api/v1/invoice_items/find?created_at=2012-03-10_00:54:09"

    show_invoiceitem = JSON.parse(response.body) 

    expect(show_invoiceitem["data"].class).to eq(Hash)
    expect(show_invoiceitem["data"].class).to_not eq(Array)

    expect(show_invoiceitem["data"]["id"]).to eq(invoiceitem_1.id.to_s)
    expect(show_invoiceitem["data"]["attributes"]["invoice_id"]).to eq(invoiceitem_1.invoice_id)
    expect(show_invoiceitem["data"]["attributes"]["quantity"]).to eq(invoiceitem_1.quantity)
    expect(show_invoiceitem["data"]["attributes"]["unit_price"]).to eq(invoiceitem_1.unit_price)
  end

  it "can send a single record after finding by updated_at(this will be better done on the find_all below)" do
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
    item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
    item_3 = merchant_1.items.create!(name: "shampoo", description: "yep, its shampoo", unit_price: 1)

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    invoiceitem_1 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 1, unit_price: 11, updated_at: "2012-03-10 00:54:09")
    invoiceitem_2 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 1, unit_price: 11, updated_at: "2011-03-10 00:54:09")

    get "/api/v1/invoice_items/find?updated_at=2012-03-10_00:54:09"

    show_invoiceitem = JSON.parse(response.body) 

    expect(show_invoiceitem["data"].class).to eq(Hash)
    expect(show_invoiceitem["data"].class).to_not eq(Array)

    expect(show_invoiceitem["data"]["id"]).to eq(invoiceitem_1.id.to_s)
    expect(show_invoiceitem["data"]["attributes"]["invoice_id"]).to eq(invoiceitem_1.invoice_id)
    expect(show_invoiceitem["data"]["attributes"]["quantity"]).to eq(invoiceitem_1.quantity)
    expect(show_invoiceitem["data"]["attributes"]["unit_price"]).to eq(invoiceitem_1.unit_price)
  end
end
