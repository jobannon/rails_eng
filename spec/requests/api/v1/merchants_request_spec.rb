require "rails_helper"

RSpec.describe "Merchants API" do 
  it "sends a list of merchants (merchants index)" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    merchant_2 = Merchant.create!(name: "Sallys Superstore")
    merchant_3 = Merchant.create!(name: "Bills Superstore")

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)
    expect(merchants["data"][0]["attributes"]["name"]).to eq("Johns Superstore")
    expect(merchants["data"].count).to eq(3)
  end


  it "sends an individual show record for a merchant (merchant show page)" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    merchant_2 = Merchant.create!(name: "Sallys Superstore")

    get "/api/v1/merchants/#{merchant_1.id}"

    expect(response).to be_successful

    this_merchant = JSON.parse(response.body)
    expect(this_merchant["data"]["attributes"]["name"]).to eq("Johns Superstore")
    expect(this_merchant["data"]["id"].to_i).to eq(merchant_1.id)
  end

  it "sends a list of items for a given merchant relationship" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    merchant_2 = Merchant.create!(name: "Sallys Superstore")
    item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
    item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
    item_3 = merchant_2.items.create!(name: "shampoo", description: "yep, its shampoo", unit_price: 1)

    get "/api/v1/merchants/#{merchant_1.id}/items"

    items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(items["data"].first["attributes"]["name"]).to eq("toothbrush")
    expect(items["data"].first["attributes"]["description"]).to eq("yep, its a toothbrush")
    expect(items["data"].first["attributes"]["unit_price"]).to eq(100)

    expect(items["data"].count).to eq(2)

  end

  it "returns a list of the top user defined merchants by total revenue(most_revenue=x)" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    merchant_2 = Merchant.create!(name: "Sallys Superstore")
    merchant_3 = Merchant.create!(name: "Joes Superstore")

    item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
    customer_1 = Customer.create!(first_name: "josh", last_name: "tim")
    invoice_1 = Invoice.create!(customer_id: customer_1.id, merchant_id: merchant_1.id, status: "processed")  
    invoice_item_1 = InvoiceItem.create!(invoice_id: invoice_1.id, item_id: item_1.id, quantity: 2, unit_price: 10) 

    item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
    customer_1 = Customer.create!(first_name: "josh", last_name: "tim")
    invoice_1 = Invoice.create!(customer_id: customer_1.id, merchant_id: merchant_1.id, status: "processed")  
    invoice_item_1 = InvoiceItem.create!(invoice_id: invoice_1.id, item_id: item_1.id, quantity: 2, unit_price: 10) 

    item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
    customer_1 = Customer.create!(first_name: "josh", last_name: "tim")
    invoice_2 = Invoice.create!(customer_id: customer_1.id, merchant_id: merchant_1.id, status: "processed")  
    invoice_item_1 = InvoiceItem.create!(invoice_id: invoice_2.id, item_id: item_2.id, quantity: 2, unit_price: 10) 
    

    get '/api/v1/merchants/most_revenue?quantity=1'

    top_two = JSON.parse(response.body)

    expect(response).to be_successful
  end

  it "it can find merchant by params (:id)" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    merchant_2 = Merchant.create!(name: "Sallys Superstore")
    merchant_3 = Merchant.create!(name: "Joes Superstore")

    get "/api/v1/merchants/find?id=#{merchant_1.id}"
     
    merchant_response = JSON.parse(response.body)
    expect(merchant_response["data"]["attributes"]["name"]).to eq("Johns Superstore")
  end

  it "it can find merchant by params (:name)" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    merchant_2 = Merchant.create!(name: "Sallys Superstore")
    merchant_3 = Merchant.create!(name: "Joes Superstore")

    get "/api/v1/merchants/find?name=#{merchant_1.name}"

    merchant_response = JSON.parse(response.body)
    expect(merchant_response["data"]["attributes"]["name"]).to eq("Johns Superstore")
  end

  it "it can find merchant by params (:create_at)" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore", created_at: "Thu, 30 Jan 2020 01:50:39" )
    merchant_2 = Merchant.create!(name: "Sallys Superstore")
    merchant_3 = Merchant.create!(name: "Joes Superstore")

    get "/api/v1/merchants/find?created_at=#{merchant_1.created_at}"
    merchant_response = JSON.parse(response.body)

    expect(merchant_response["data"]["id"]).to eq(merchant_1.id.to_s)
    expect(merchant_response["data"]["attributes"]["name"]).to eq(merchant_1.name)
  end

  it "it can find merchant by params (:updated_at)" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore", updated_at: "Thu, 30 Jan 2020 01:50:39" )
    merchant_2 = Merchant.create!(name: "Sallys Superstore")
    merchant_3 = Merchant.create!(name: "Joes Superstore")

    get "/api/v1/merchants/find?updated_at=#{merchant_1.updated_at}"
    merchant_response = JSON.parse(response.body)

    expect(merchant_response["data"]["id"]).to eq(merchant_1.id.to_s)
    expect(merchant_response["data"]["attributes"]["name"]).to eq(merchant_1.name)
  end
#**********
  it "it can **find_all** merchants by params (:id)" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    merchant_2 = Merchant.create!(name: "Sallys Superstore")
    merchant_3 = Merchant.create!(name: "Joes Superstore")

    get "/api/v1/merchants/find_all?id=#{merchant_1.id}"
     
    merchant_response = JSON.parse(response.body)
    expect(merchant_response["data"]["attributes"]["name"]).to eq("Johns Superstore")
    expect(merchant_response["data"].count).to eq(1)
  end

  it "it can **find_all** merchants by params (:name)" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    merchant_2 = Merchant.create!(name: "Johns Superstore")
    merchant_3 = Merchant.create!(name: "Joes Superstore")

    get "/api/v1/merchants/find_all?name=#{merchant_1.name}"

    merchant_response = JSON.parse(response.body)

    expect(merchant_response["data"].first["attributes"]["name"]).to eq("Johns Superstore")
    expect(merchant_response["data"].last["attributes"]["name"]).to eq("Johns Superstore")
    expect(merchant_response["data"].count).to eq(2)
  end

  it "it can **find_all** merchants by params (:create_at)" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore", created_at: "Thu, 30 Jan 2020 01:50:39" )
    merchant_2 = Merchant.create!(name: "Sallys Superstore", created_at: "Thu, 30 Jan 2020 01:50:39")
    merchant_3 = Merchant.create!(name: "Joes Superstore", created_at: "Thu, 30 Jan 2020 01:50:39")
    merchant_4 = Merchant.create!(name: "Supers Superstore")

    get "/api/v1/merchants/find_all?created_at=#{merchant_1.created_at}"
    merchant_response = JSON.parse(response.body)

    expect(merchant_response["data"].first["attributes"]["name"]).to eq(merchant_1.name)
    expect(merchant_response["data"][1]["attributes"]["name"]).to eq(merchant_2.name)
    expect(merchant_response["data"][2]["attributes"]["name"]).to eq(merchant_3.name)
    expect(merchant_response["data"].count).to eq(3)
  end

  it "it can **find_all** merchants by params (:updated_at)" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore", updated_at: "Thu, 30 Jan 2020 01:50:39" )
    merchant_2 = Merchant.create!(name: "Sallys Superstore", updated_at: "Thu, 30 Jan 2020 01:50:39")
    merchant_3 = Merchant.create!(name: "Joes Superstore", updated_at: "Thu, 30 Jan 2020 01:50:39")
    merchant_4 = Merchant.create!(name: "Supers Superstore")

    get "/api/v1/merchants/find_all?updated_at=#{merchant_1.updated_at}"
    merchant_response = JSON.parse(response.body)

    expect(merchant_response["data"].first["attributes"]["name"]).to eq(merchant_1.name)
    expect(merchant_response["data"][1]["attributes"]["name"]).to eq(merchant_2.name)
    expect(merchant_response["data"][2]["attributes"]["name"]).to eq(merchant_3.name)
    expect(merchant_response["data"].count).to eq(3)
  end
end
