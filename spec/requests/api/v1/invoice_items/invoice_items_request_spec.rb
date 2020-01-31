require "rails_helper"

RSpec.describe "InvoiceItem API" do 

  it "get get record of a single invoiceitem" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
    item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
    item_3 = merchant_1.items.create!(name: "shampoo", description: "yep, its shampoo", unit_price: 1)

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    invoiceitem_1 = InvoiceItem.create(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 1, unit_price: 11)

    get "/api/v1/invoice_items/#{invoiceitem_1.id}"
     
    show_invoiceitem = JSON.parse(response.body)

    expect(show_invoiceitem["data"].class).to eq(Hash)
    expect(show_invoiceitem["data"].class).to_not eq(Array)
    expect(show_invoiceitem["data"]["id"]).to eq(invoiceitem_1.id.to_s)
    
    expect(show_invoiceitem["data"]["attributes"]["item_id"]).to eq(invoiceitem_1.item_id)
    expect(show_invoiceitem["data"]["attributes"]["invoice_id"]).to eq(invoiceitem_1.invoice_id)
    expect(show_invoiceitem["data"]["attributes"]["quantity"]).to eq(invoiceitem_1.quantity)
    expect(show_invoiceitem["data"]["attributes"]["unit_price"]).to eq(invoiceitem_1.unit_price)
  end

  it "gets a index record of invoices" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
    item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
    item_3 = merchant_1.items.create!(name: "shampoo", description: "yep, its shampoo", unit_price: 1)

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    invoiceitem_1 = InvoiceItem.create(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 1, unit_price: 11)
    invoiceitem_2 = InvoiceItem.create(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 1, unit_price: 21)
    invoiceitem_3 = InvoiceItem.create(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 1, unit_price: 31)

    get "/api/v1/invoice_items/"
     
    index_invoice_item = JSON.parse(response.body)

    expect(index_invoice_item["data"].class).to eq(Array)
    expect(index_invoice_item["data"].class).to_not eq(Hash)
    expect(index_invoice_item["data"].count). to eq(3)

    expect(index_invoice_item["data"].first["attributes"]["item_id"]).to eq(invoiceitem_1.item_id)
    expect(index_invoice_item["data"].first["attributes"]["invoice_id"]).to eq(invoiceitem_1.invoice_id)
    expect(index_invoice_item["data"].first["attributes"]["quantity"]).to eq(invoiceitem_1.quantity)
    expect(index_invoice_item["data"].first["attributes"]["unit_price"]).to eq(invoiceitem_1.unit_price)
  end
end
