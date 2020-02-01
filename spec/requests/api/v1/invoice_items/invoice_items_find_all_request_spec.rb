require "rails_helper"

RSpec.describe "Invoices API find all methods" do 
  it "can send multiple records after doing a find_all on InvoiceItem.item_id" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
    item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
    item_3 = merchant_1.items.create!(name: "shampoo", description: "yep, its shampoo", unit_price: 1)

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    invoiceitem_1 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 1, unit_price: 11)
    invoiceitem_2 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 1, unit_price: 11)
    invoiceitem_3 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 1, unit_price: 11)

    get "/api/v1/invoice_items/find_all?item_id=#{invoiceitem_1.item_id}"

    show_invoiceitem = JSON.parse(response.body) 

    expect(show_invoiceitem["data"].class).to eq(Array)
    expect(show_invoiceitem["data"].class).to_not eq(Hash)

    expect(show_invoiceitem["data"][0]["id"]).to eq(invoiceitem_1.id.to_s)
    expect(show_invoiceitem["data"][1]["id"]).to eq(invoiceitem_2.id.to_s)
    expect(show_invoiceitem["data"][2]["id"]).to eq(invoiceitem_3.id.to_s)
    expect(show_invoiceitem["data"].count).to eq(3)

    expect(show_invoiceitem["data"][0]["attributes"]["item_id"]).to eq(invoiceitem_1.item_id)
    expect(show_invoiceitem["data"][1]["attributes"]["item_id"]).to eq(invoiceitem_2.item_id)
    expect(show_invoiceitem["data"][2]["attributes"]["item_id"]).to eq(invoiceitem_3.item_id)
  end  

  it "can send multiple records after doing a find_all on invoiceitem.invoice_id" do 
    merchant_1 = Merchant.create!(name: "johns superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
    item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
    item_3 = merchant_1.items.create!(name: "shampoo", description: "yep, its shampoo", unit_price: 1)

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    invoiceitem_1 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 1, unit_price: 11)
    invoiceitem_2 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 1, unit_price: 11)
    invoiceitem_3 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 1, unit_price: 11)

    get "/api/v1/invoice_items/find_all?invoice_id=#{invoiceitem_1.invoice_id}"

    show_invoiceitem = JSON.parse(response.body) 

    expect(show_invoiceitem["data"].class).to eq(Array)
    expect(show_invoiceitem["data"].class).to_not eq(Hash)

    expect(show_invoiceitem["data"][0]["id"]).to eq(invoiceitem_1.id.to_s)
    expect(show_invoiceitem["data"][1]["id"]).to eq(invoiceitem_2.id.to_s)
    expect(show_invoiceitem["data"][2]["id"]).to eq(invoiceitem_3.id.to_s)
    expect(show_invoiceitem["data"].count).to eq(3)

    expect(show_invoiceitem["data"][0]["attributes"]["invoice_id"]).to eq(invoiceitem_1.invoice_id)
    expect(show_invoiceitem["data"][1]["attributes"]["invoice_id"]).to eq(invoiceitem_2.invoice_id)
    expect(show_invoiceitem["data"][2]["attributes"]["invoice_id"]).to eq(invoiceitem_3.invoice_id)
  end  

  it "can send multiple records after doing a find_all on InvoiceItem.quantity" do 
    merchant_1 = Merchant.create!(name: "johns superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
    item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
    item_3 = merchant_1.items.create!(name: "shampoo", description: "yep, its shampoo", unit_price: 1)

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    invoiceitem_1 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 555, unit_price: 11)
    invoiceitem_2 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 555, unit_price: 11)
    invoiceitem_3 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 555, unit_price: 11)

    get "/api/v1/invoice_items/find_all?quantity=#{invoiceitem_1.quantity}"

    show_invoiceitem = JSON.parse(response.body) 

    expect(show_invoiceitem["data"].class).to eq(Array)
    expect(show_invoiceitem["data"].class).to_not eq(Hash)

    expect(show_invoiceitem["data"][0]["id"]).to eq(invoiceitem_1.id.to_s)
    expect(show_invoiceitem["data"][1]["id"]).to eq(invoiceitem_2.id.to_s)
    expect(show_invoiceitem["data"][2]["id"]).to eq(invoiceitem_3.id.to_s)
    expect(show_invoiceitem["data"].count).to eq(3)

    expect(show_invoiceitem["data"][0]["attributes"]["quantity"]).to eq(invoiceitem_1.quantity)
    expect(show_invoiceitem["data"][1]["attributes"]["quantity"]).to eq(invoiceitem_2.quantity)
    expect(show_invoiceitem["data"][2]["attributes"]["quantity"]).to eq(invoiceitem_3.quantity)
  end  

  it "can send multiple records after doing a find_all on Invoiceitem.unit_price" do 
    merchant_1 = Merchant.create!(name: "johns superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
    item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
    item_3 = merchant_1.items.create!(name: "shampoo", description: "yep, its shampoo", unit_price: 1)

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    invoiceitem_1 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 555, unit_price: 11)
    invoiceitem_2 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 555, unit_price: 11)
    invoiceitem_3 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 555, unit_price: 11)

    get "/api/v1/invoice_items/find_all?unit_price=#{invoiceitem_1.unit_price}"

    show_invoiceitem = JSON.parse(response.body) 

    expect(show_invoiceitem["data"].class).to eq(Array)
    expect(show_invoiceitem["data"].class).to_not eq(Hash)

    expect(show_invoiceitem["data"][0]["id"]).to eq(invoiceitem_1.id.to_s)
    expect(show_invoiceitem["data"][1]["id"]).to eq(invoiceitem_2.id.to_s)
    expect(show_invoiceitem["data"][2]["id"]).to eq(invoiceitem_3.id.to_s)
    expect(show_invoiceitem["data"].count).to eq(3)

    expect(show_invoiceitem["data"][0]["attributes"]["unit_price"]).to eq(invoiceitem_1.unit_price)
    expect(show_invoiceitem["data"][1]["attributes"]["unit_price"]).to eq(invoiceitem_2.unit_price)
    expect(show_invoiceitem["data"][2]["attributes"]["unit_price"]).to eq(invoiceitem_3.unit_price)
  end  

  it "can send multiple records after doing a find_all on Invoiceitem.created_at" do 
    merchant_1 = Merchant.create!(name: "johns superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
    item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
    item_3 = merchant_1.items.create!(name: "shampoo", description: "yep, its shampoo", unit_price: 1)

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    invoiceitem_1 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 555, unit_price: 11, created_at: "2012-03-10 00:54:09" )
    invoiceitem_2 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 555, unit_price: 11, created_at: "2012-03-10 00:54:09" ) 
    invoiceitem_3 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 555, unit_price: 11, created_at: "2012-03-10 00:54:09" )
    invoiceitem_4 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 555, unit_price: 11, created_at: "2012-04-10 00:54:09" )

    get "/api/v1/invoice_items/find_all?created_at=2012-03-10_00:54:09"

    show_invoiceitem = JSON.parse(response.body) 

    expect(show_invoiceitem["data"].class).to eq(Array)
    expect(show_invoiceitem["data"].class).to_not eq(Hash)

    expect(show_invoiceitem["data"][0]["id"]).to eq(invoiceitem_1.id.to_s)
    expect(show_invoiceitem["data"][1]["id"]).to eq(invoiceitem_2.id.to_s)
    expect(show_invoiceitem["data"][2]["id"]).to eq(invoiceitem_3.id.to_s)
    expect(show_invoiceitem["data"].count).to eq(3)
  end  

  it "can send multiple records after doing a find_all on Invoiceitem.updated_at" do 
    merchant_1 = Merchant.create!(name: "johns superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
    item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
    item_3 = merchant_1.items.create!(name: "shampoo", description: "yep, its shampoo", unit_price: 1)

    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    invoiceitem_1 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 555, unit_price: 11, updated_at: "2012-03-10 00:54:09" )
    invoiceitem_2 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 555, unit_price: 11, updated_at: "2012-03-10 00:54:09" ) 
    invoiceitem_3 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 555, unit_price: 11, updated_at: "2012-03-10 00:54:09" )
    invoiceitem_4 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 555, unit_price: 11, updated_at: "2012-04-10 00:54:09" )

    get "/api/v1/invoice_items/find_all?updated_at=2012-03-10_00:54:09"

    show_invoiceitem = JSON.parse(response.body) 

    expect(show_invoiceitem["data"].class).to eq(Array)
    expect(show_invoiceitem["data"].class).to_not eq(Hash)

    expect(show_invoiceitem["data"][0]["id"]).to eq(invoiceitem_1.id.to_s)
    expect(show_invoiceitem["data"][1]["id"]).to eq(invoiceitem_2.id.to_s)
    expect(show_invoiceitem["data"][2]["id"]).to eq(invoiceitem_3.id.to_s)
    expect(show_invoiceitem["data"].count).to eq(3)
  end  
end
