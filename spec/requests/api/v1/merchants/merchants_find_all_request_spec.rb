require 'rails_helper'

RSpec.describe "Merchants API Finder **find all ** methods" do 
  it "it can **find_all** merchants by params (:id)" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    merchant_2 = Merchant.create!(name: "Sallys Superstore")
    merchant_3 = Merchant.create!(name: "Joes Superstore")

    get "/api/v1/merchants/find_all?id=#{merchant_1.id}"
     
    merchant_response = JSON.parse(response.body)
    expect(merchant_response["data"].first["attributes"]["name"]).to eq("Johns Superstore")
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

 
