require "rails_helper"

RSpec.describe "InvoicesItems API" do 
  describe "relationships" do
    it "sends the assoicated invoices" do 
      merchant_1 = Merchant.create!(name: "johns superstore")
      customer_1 = Customer.create!(first_name: "josh", last_name: "student")

      item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
      item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
      item_3 = merchant_1.items.create!(name: "shampoo", description: "yep, its shampoo", unit_price: 1)

      invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
      invoice_2 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
      invoice_3 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")

      invoiceitem_1 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 555, unit_price: 11, updated_at: "2012-03-10 00:54:09" )
      invoiceitem_2 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 555, unit_price: 11, updated_at: "2012-03-10 00:54:09" ) 
      invoiceitem_3 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 555, unit_price: 11, updated_at: "2012-03-10 00:54:09" )
      invoiceitem_4 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 555, unit_price: 11, updated_at: "2012-04-10 00:54:09" )

      get "/api/v1/customers/#{customer_1.id}/invoices"

      show_invoices = JSON.parse(response.body) 

      expect(show_invoices["data"].class).to eq(Array)
      expect(show_invoices["data"].class).to_not eq(Hash)

      expect(show_invoices["data"][0]["id"]).to eq(customer_1.invoices[0].id.to_s)
      expect(show_invoices["data"].count).to eq(3)
    end

    it "sends the assoicated transactions" do 
      merchant_1 = Merchant.create!(name: "johns superstore")
      customer_1 = Customer.create!(first_name: "josh", last_name: "student")

      item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
      item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
      item_3 = merchant_1.items.create!(name: "shampoo", description: "yep, its shampoo", unit_price: 1)

      invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
      invoice_2 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
      invoice_3 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")

      invoiceitem_1 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 555, unit_price: 11, updated_at: "2012-03-10 00:54:09" )
      invoiceitem_2 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 555, unit_price: 11, updated_at: "2012-03-10 00:54:09" ) 
      invoiceitem_3 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 555, unit_price: 11, updated_at: "2012-03-10 00:54:09" )
      invoiceitem_4 = InvoiceItem.create!(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 555, unit_price: 11, updated_at: "2012-04-10 00:54:09" )

      transaction_1 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "4444.4444.4444", result: "successful")
      transaction_2 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "5555.5555.5555", result: "successful")
      transaction_3 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "6666.6666.6666", result: "successful")

      get "/api/v1/customers/#{customer_1.id}/transactions"

      show_transactions = JSON.parse(response.body) 

      expect(show_transactions["data"].class).to eq(Array)
      expect(show_transactions["data"].class).to_not eq(Hash)

      expect(show_transactions["data"][0]["id"]).to eq(customer_1.transactions[0].id.to_s)
      expect(show_transactions["data"].count).to eq(3)
    end
  end
end
