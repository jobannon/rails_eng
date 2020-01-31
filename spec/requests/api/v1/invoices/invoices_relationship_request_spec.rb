require "rails_helper"

RSpec.describe "Invoices API" do 
  describe "relationships" do
    it "sends a list of invoice transactions" do 
      merchant_1 = Merchant.create!(name: "Johns Superstore")
      customer_1 = Customer.create!(first_name: "josh", last_name: "student")
      invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")

      transaction_1 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "4444.4444.4444", result: "successful")
      transaction_2 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "5555.5555.5555", result: "successful")
      transaction_2 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "6666.6666.6666", result: "successful")

      get "/api/v1/invoices/#{invoice_1.id}/transactions"

      expect(response).to be_successful

      transactions_response = JSON.parse(response.body) 

      expect(transactions_response["data"].count).to eq(3)
      expect(transactions_response["data"].first["id"]).to eq(transaction_1.id.to_s) 
      expect(transactions_response["data"].first["attributes"]["invoice_id"]).to eq(invoice_1.id)
      expect(transactions_response["data"].first["attributes"]["credit_card_number"]).to eq(transaction_1.credit_card_number.to_s)
      expect(transactions_response["data"].first["attributes"]["result"]).to eq(transaction_1.result.to_s)
      expect(transactions_response["data"][1]["attributes"]["invoice_id"]).to eq(invoice_1.id)
      expect(transactions_response["data"][2]["attributes"]["invoice_id"]).to eq(invoice_1.id)
    end

    it "sends a list of invoice_items" do 
      merchant_1 = Merchant.create!(name: "Johns Superstore")
      customer_1 = Customer.create!(first_name: "josh", last_name: "student")
      item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
      item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
      item_3 = merchant_1.items.create!(name: "shampoo", description: "yep, its shampoo", unit_price: 1)

      invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")

      invoice_item_1 = InvoiceItem.create!(item_id: item_1.id ,invoice_id: invoice_1.id, quantity: 1, unit_price: 100)
      invoice_item_2 = InvoiceItem.create!(item_id: item_2.id ,invoice_id: invoice_1.id, quantity: 1, unit_price: 100)

      get "/api/v1/invoices/#{invoice_1.id}/invoice_items"

      invoice_items_response = JSON.parse(response.body)

      expect(invoice_items_response["data"].count).to eq(2)
      expect(invoice_items_response["data"][0]["attributes"]["item_id"]).to eq(invoice_item_1.item_id)
      expect(invoice_items_response["data"].first["attributes"]["invoice_id"]).to eq(invoice_item_1.invoice_id)
      expect(invoice_items_response["data"].first["attributes"]["quantity"]).to eq(invoice_item_1.quantity)
      expect(invoice_items_response["data"].first["attributes"]["unit_price"]).to eq(invoice_item_1.unit_price)
    end

    it "sends a list of assoicated items for a given invoice" do 
      merchant_1 = Merchant.create!(name: "Johns Superstore")
      customer_1 = Customer.create!(first_name: "josh", last_name: "student")
      item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
      item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
      item_3 = merchant_1.items.create!(name: "shampoo", description: "yep, its shampoo", unit_price: 1)

      invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
      invoice_item_1 = InvoiceItem.create!(item_id: item_1.id ,invoice_id: invoice_1.id, quantity: 1, unit_price: 100)
      invoice_item_2 = InvoiceItem.create!(item_id: item_2.id ,invoice_id: invoice_1.id, quantity: 1, unit_price: 100)
      invoice_item_2 = InvoiceItem.create!(item_id: item_3.id ,invoice_id: invoice_1.id, quantity: 1, unit_price: 100)

      get "/api/v1/invoices/#{invoice_1.id}/items"
      
      items_for_invoice_response = JSON.parse(response.body)
      expect(items_for_invoice_response["data"].count).to eq(3)
      expect(items_for_invoice_response["data"].first["attributes"]["name"]).to eq(item_1.name)
      expect(items_for_invoice_response["data"].first["attributes"]["description"]).to eq(item_1.description)
      expect(items_for_invoice_response["data"].first["attributes"]["unit_price"]).to eq(item_1.unit_price)
    end

    it "sends a record of the customer for an invoice" do
      merchant_1 = Merchant.create!(name: "Johns Superstore")
      customer_1 = Customer.create!(first_name: "josh", last_name: "student")
      item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
      item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
      item_3 = merchant_1.items.create!(name: "shampoo", description: "yep, its shampoo", unit_price: 1)

      invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")

      get "/api/v1/invoices/#{invoice_1.id}/customer"

      invoice_customer_response = JSON.parse(response.body)

      expect(invoice_customer_response["data"].class).to eq(Hash)
      expect(invoice_customer_response["data"].class).to_not eq(Array)
      expect(invoice_customer_response["data"]["attributes"]["first_name"]).to eq(customer_1.first_name.to_s)
      expect(invoice_customer_response["data"]["attributes"]["last_name"]).to eq(customer_1.last_name.to_s)
    end

    it "send a record of the assoicated merchant for the invoice" do 
      merchant_1 = Merchant.create!(name: "Johns Superstore")
      customer_1 = Customer.create!(first_name: "josh", last_name: "student")
      item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
      item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
      item_3 = merchant_1.items.create!(name: "shampoo", description: "yep, its shampoo", unit_price: 1)

      invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")

      get "/api/v1/invoices/#{invoice_1.id}/merchant"

      invoice_merchant_response = JSON.parse(response.body)

      expect(invoice_merchant_response["data"].class).to eq(Hash)
      expect(invoice_merchant_response["data"].class).to_not eq(Array)
      expect(invoice_merchant_response["data"]["attributes"]["name"]).to eq(merchant_1.name.to_s)
    end
  end
end
