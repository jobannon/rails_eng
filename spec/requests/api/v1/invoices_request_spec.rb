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
      get "/api/v1/invoices/:id/invoice_items"

#     "item_id"
#     "invoice_id"
#      "quantity"
#      "unit_price"
#      "created_at", null: false
#      "updated_at", null: false




    end
  end
end
