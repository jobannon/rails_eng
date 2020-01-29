require "rails_helper"

RSpec.describe "Merchants API" do 
  it "sends a list of merchants (index)" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    merchant_2 = Merchant.create!(name: "Sallys Superstore")
    merchant_3 = Merchant.create!(name: "Bills Superstore")

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)
    expect(merchants["data"][0]["attributes"]["name"]).to eq("Johns Superstore")
    expect(merchants["data"].count).to eq(3)
  end

  it "sends relationships" do 
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    merchant_2 = Merchant.create!(name: "Sallys Superstore")
    item_1 = merchant_1.items.create(name: "toothbrush", description: "yep, its a toothbrush", unit_price: 100)
    item_2 = merchant_1.items.create(name: "soap", description: "yep, its soap", unit_price: 10)
    item_3 = merchant_2.items.create!(name: "shampoo", description: "yep, its shampoo", unit_price: 1)

    get "/api/v1/merchants/#{merchant_1.id}/items"

    items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(items["data"].first["attributes"]["name"]).to eq("toothbrush")
    binding.pry
    expect(items["data"].first["attributes"]["description"]).to eq("yep, its a toothbrush")

    expect(items["data"].first["attributes"]["unit_price"]).to eq(100)
    
    expect(items["data"].count).to eq(2)

  end

end
