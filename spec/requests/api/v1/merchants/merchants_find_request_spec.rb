require "rails_helper"

RSpec.describe "Merchants API Finder methods" do 
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

  it "it can find merchant by params (:created_at)" do 
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

  it "can find a random resource" do
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    merchant_2 = Merchant.create!(name: "Sallys Superstore")
    merchant_3 = Merchant.create!(name: "Joes Superstore")
    merchant_4 = Merchant.create!(name: "Supers Superstore")

    get "/api/v1/merchants/random?updated_at=#{merchant_1.updated_at}"
    merchant_response = JSON.parse(response.body)

    expect(Merchant.find_rand.class).to eq(Merchant)
  end
end
