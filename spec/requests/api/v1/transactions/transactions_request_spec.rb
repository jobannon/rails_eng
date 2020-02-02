
require "rails_helper"

RSpec.describe "Transactions API" do 

  it "get get record of a single Transaction" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")
    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")

    transaction_1 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "4444.4444.4444", result: "successful")
    transaction_2 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "5555.5555.5555", result: "successful")
    transaction_3 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "6666.6666.6666", result: "successful")

    get "/api/v1/transactions/#{transaction_1.id}"
     
    show_transaction = JSON.parse(response.body)

    expect(show_transaction["data"].class).to eq(Hash)
    expect(show_transaction["data"].class).to_not eq(Array)
    expect(show_transaction["data"]["id"]).to eq(transaction_1.id.to_s)
    expect(show_transaction["data"]["attributes"].count).to eq(4)
  end

  it "sends a list of transactions (index)" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")
    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    transaction_1 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "4444.4444.4444", result: "successful")
    transaction_2 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "5555.5555.5555", result: "successful")
    transaction_3 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "6666.6666.6666", result: "successful")

    get '/api/v1/transactions'

    expect(response).to be_successful

    show_transaction = JSON.parse(response.body)

    expect(show_transaction["data"].class).to eq(Array)
    expect(show_transaction["data"].class).to_not eq(Hash)
    expect(show_transaction["data"][0]["attributes"]["id"]).to eq(transaction_1.id)
    expect(show_transaction["data"][1]["attributes"]["id"]).to eq(transaction_2.id)
    expect(show_transaction["data"][2]["attributes"]["id"]).to eq(transaction_3.id)
    expect(show_transaction["data"].count).to eq(3)
  end
end
