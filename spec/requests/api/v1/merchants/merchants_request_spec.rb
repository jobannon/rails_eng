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
end
