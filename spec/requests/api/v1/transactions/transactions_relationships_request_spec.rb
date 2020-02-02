require "rails_helper"

RSpec.describe "Transaction Relationship API" do 
  it "returns the assoicated invoice for a transaction" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")
    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    invoice_2 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    invoice_3 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    transaction_1 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "4654405418249632", result: "success", created_at: "Thu, 30 Jan 2020 01:50:39")
    transaction_2 = Transaction.create!(invoice_id: invoice_2.id, credit_card_number: "4580251236515201", result: "success", created_at: "Thu, 30 Jan 2020 01:50:39")
    transaction_3 = Transaction.create!(invoice_id: invoice_3.id, credit_card_number: "4515551623735607", result: "success", created_at: "Thu, 30 Jan 2020 01:50:39")

    get "/api/v1/transactions/#{transaction_1.id}/invoice"

    expect(response).to be_successful

    show_invoice= JSON.parse(response.body)

    expect(show_invoice["data"].class).to eq(Hash)
    expect(show_invoice["data"].class).to_not eq(Array)
    expect(show_invoice["data"]["id"]).to eq(invoice_1.id.to_s)
  end
end
