
require "rails_helper"

RSpec.describe "InvoicesItems API" do 
  describe "relationships" do
    it "sends the assoicated invoice" do 
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

      get "/api/v1/invoice_items/#{invoiceitem_1.id}/invoice"

      show_invoice = JSON.parse(response.body) 

      expect(show_invoice["data"].class).to eq(Hash)
      expect(show_invoice["data"].class).to_not eq(Array)

      expect(show_invoice["data"]["id"]).to eq(invoiceitem_1.invoice_id.to_s)
    end

    it "sends the assoicated item" do 
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

      get "/api/v1/invoice_items/#{invoiceitem_1.id}/item"

      show_invoice = JSON.parse(response.body) 

      expect(show_invoice["data"].class).to eq(Hash)
      expect(show_invoice["data"].class).to_not eq(Array)

      expect(show_invoice["data"]["id"]).to eq(invoiceitem_1.item_id.to_s)
    end
  end
end
