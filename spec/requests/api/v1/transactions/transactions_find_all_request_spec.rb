require "rails_helper"

RSpec.describe "Transaction Finder (find_all)" do 
  it "sends a record by finding by invoice_id" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")
    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    transaction_1 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "4444.4444.4444", result: "successful")
    transaction_2 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "5555.5555.5555", result: "successful")
    transaction_3 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "6666.6666.6666", result: "successful")

    get "/api/v1/transactions/find_all?id=#{transaction_1.id}"

    expect(response).to be_successful

    show_transaction = JSON.parse(response.body)

    expect(show_transaction["data"].class).to eq(Array)
    expect(show_transaction["data"].class).to_not eq(Hash)
    expect(show_transaction["data"][0]["attributes"]["invoice_id"]).to eq(transaction_1.invoice_id)
    expect(show_transaction["data"][0]["attributes"]["result"]).to eq(transaction_1.result)
    expect(show_transaction["data"][0]["attributes"]["id"]).to eq(transaction_1.id)
  end

  it "sends a record by finding by credit_card_number" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")
    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    transaction_1 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "44654405418249632", result: "successful")
    transaction_2 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "4580251236515201", result: "successful")
    transaction_3 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "4515551623735607", result: "successful")

    get "/api/v1/transactions/find_all?credit_card_number=#{transaction_1.credit_card_number}"

    expect(response).to be_successful

    show_transaction = JSON.parse(response.body)

    expect(show_transaction["data"].class).to eq(Array)
    expect(show_transaction["data"].class).to_not eq(Hash)
    expect(show_transaction["data"][0]["attributes"]["invoice_id"]).to eq(transaction_1.invoice_id)
    # expect(show_transaction["data"][0]["attributes"]["credit_card_number"]).to eq(transaction_1.credit_card_number.round(0))
    expect(show_transaction["data"][0]["attributes"]["result"]).to eq(transaction_1.result)
    expect(show_transaction["data"][0]["attributes"]["id"]).to eq(transaction_1.id)
  end

  it "sends a record by finding by credit_card_expiration_date" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")
    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    transaction_1 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "44654405418249632", result: "successful")
    transaction_2 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "4580251236515201", result: "successful")
    transaction_3 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "4515551623735607", result: "successful")

    get "/api/v1/transactions/find_all?credit_card_expiration_date=#{transaction_1.credit_card_expiration_date}"

    expect(response).to be_successful

    show_transaction = JSON.parse(response.body)

    expect(show_transaction["data"].class).to eq(Array)
    expect(show_transaction["data"].class).to_not eq(Hash)
    expect(show_transaction["data"].count).to eq(3)
    expect(show_transaction["data"][0]["attributes"]["invoice_id"]).to eq(transaction_1.invoice_id)
    # expect(show_transaction["data"][0]["attributes"]["credit_card_number"]).to eq(transaction_1.credit_card_number.round(0))
    expect(show_transaction["data"][0]["attributes"]["result"]).to eq(transaction_1.result)
    expect(show_transaction["data"][0]["attributes"]["id"]).to eq(transaction_1.id)
  end

  it "sends a record by finding by result" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")
    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    transaction_1 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "44654405418249632", result: "success")
    transaction_2 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "4580251236515201", result: "success")
    transaction_3 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "4515551623735607", result: "success")

    get "/api/v1/transactions/find_all?result=#{transaction_1.result}"

    expect(response).to be_successful

    show_transaction = JSON.parse(response.body)

    expect(show_transaction["data"].class).to eq(Array)
    expect(show_transaction["data"].class).to_not eq(Hash)
    expect(show_transaction["data"].count).to eq(3)
    expect(show_transaction["data"][0]["attributes"]["invoice_id"]).to eq(transaction_1.invoice_id)
    # expect(show_transaction["data"][0]["attributes"]["credit_card_number"]).to eq(transaction_1.credit_card_number.round(0))
    expect(show_transaction["data"][0]["attributes"]["result"]).to eq(transaction_1.result)
    expect(show_transaction["data"][0]["attributes"]["id"]).to eq(transaction_1.id)
  end

  it "sends a record by finding by created_at" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")
    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    transaction_1 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "4654405418249632", result: "success", created_at: "Thu, 30 Jan 2020 01:50:39")
    transaction_2 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "4580251236515201", result: "success", created_at: "Thu, 30 Jan 2020 01:50:39")
    transaction_3 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "4515551623735607", result: "success", created_at: "Thu, 30 Jan 2020 01:50:39")

    get "/api/v1/transactions/find_all?created_at=#{transaction_1.created_at}"

    expect(response).to be_successful

    show_transaction = JSON.parse(response.body)

    expect(show_transaction["data"].class).to eq(Array)
    expect(show_transaction["data"].class).to_not eq(Hash)
    expect(show_transaction["data"].count).to eq(3)
    expect(show_transaction["data"][0]["attributes"]["invoice_id"]).to eq(transaction_1.invoice_id)
    # expect(show_transaction["data"][0]["attributes"]["credit_card_number"]).to eq(transaction_1.credit_card_number.round(0))
    expect(show_transaction["data"][0]["attributes"]["result"]).to eq(transaction_1.result)
    expect(show_transaction["data"][0]["attributes"]["id"]).to eq(transaction_1.id)
  end

  it "sends a record by finding by updated_at" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")
    invoice_1 = Invoice.create!(merchant_id: merchant_1.id, customer_id: customer_1.id, status: "processed")
    transaction_1 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "44654405418249632", result: "success", updated_at: "Thu, 30 Jan 2020 01:50:39")
    transaction_2 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "4580251236515201", result: "success", updated_at: "Thu, 30 Jan 2020 01:50:39")
    transaction_3 = Transaction.create!(invoice_id: invoice_1.id, credit_card_number: "4515551623735607", result: "success", updated_at: "Thu, 30 Jan 2020 01:50:39")

    get "/api/v1/transactions/find_all?updated_at=#{transaction_1.updated_at}"

    expect(response).to be_successful

    show_transaction = JSON.parse(response.body)

    expect(show_transaction["data"].class).to eq(Array)
    expect(show_transaction["data"].class).to_not eq(Hash)
    expect(show_transaction["data"].count).to eq(3)
    expect(show_transaction["data"][0]["attributes"]["invoice_id"]).to eq(transaction_1.invoice_id)
    # expect(show_transaction["data"][0]["attributes"]["credit_card_number"]).to eq(transaction_1.credit_card_number.round(0))
    expect(show_transaction["data"][0]["attributes"]["result"]).to eq(transaction_1.result)
    expect(show_transaction["data"][0]["attributes"]["id"]).to eq(transaction_1.id)
  end


end
  # create_table "transactions", force: :cascade do |t|
  #   t.bigint "invoice_id"
  #   t.decimal "credit_card_number"
  #   t.date "credit_card_expiration_date"
  #   t.string "result"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.index ["invoice_id"], name: "index_transactions_on_invoice_id"
  # end
