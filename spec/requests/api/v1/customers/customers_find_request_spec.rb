require "rails_helper"

RSpec.describe "Customer API Finder methods" do 
  it "it can find customer by params (:id)" do 
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")
    customer_2 = Customer.create!(first_name: "jon", last_name: "yep")
    customer_3 = Customer.create!(first_name: "billy", last_name: "yes")

    get "/api/v1/customers/find?id=#{customer_1.id}"
     
    customer_response= JSON.parse(response.body)

    expect(customer_response["data"].class).to eq(Hash)
    expect(customer_response["data"].class).to_not eq(Array)

    expect(customer_response["data"]["id"]).to eq(customer_1.id.to_s)
    expect(customer_response["data"]["attributes"]["first_name"]).to eq(customer_1.first_name)
    expect(customer_response["data"]["attributes"]["last_name"]).to eq(customer_1.last_name)
  end

  it "it can find customer by params (:first name)" do 
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")
    customer_2 = Customer.create!(first_name: "jon", last_name: "yep")
    customer_3 = Customer.create!(first_name: "billy", last_name: "yes")


    get "/api/v1/customers/find?first_name=#{customer_1.first_name}"

    customer_response= JSON.parse(response.body)

    expect(customer_response["data"].class).to eq(Hash)
    expect(customer_response["data"].class).to_not eq(Array)

    expect(customer_response["data"]["id"]).to eq(customer_1.id.to_s)
    expect(customer_response["data"]["attributes"]["first_name"]).to eq(customer_1.first_name)
    expect(customer_response["data"]["attributes"]["last_name"]).to eq(customer_1.last_name)
  end

  it "it can find customer by params (:lastname)" do 
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")
    customer_2 = Customer.create!(first_name: "jon", last_name: "yep")
    customer_3 = Customer.create!(first_name: "billy", last_name: "yes")


    get "/api/v1/customers/find?last_name=#{customer_1.last_name}"

    customer_response= JSON.parse(response.body)

    expect(customer_response["data"].class).to eq(Hash)
    expect(customer_response["data"].class).to_not eq(Array)

    expect(customer_response["data"]["id"]).to eq(customer_1.id.to_s)
    expect(customer_response["data"]["attributes"]["first_name"]).to eq(customer_1.first_name)
    expect(customer_response["data"]["attributes"]["last_name"]).to eq(customer_1.last_name)
  end
   
  it "it can find customer by params (:created_at)" do 
    customer_1 = Customer.create!(first_name: "josh", last_name: "student", created_at: "Thu, 30 Jan 2020 01:50:39")
    customer_2 = Customer.create!(first_name: "jon", last_name: "yep")
    customer_3 = Customer.create!(first_name: "billy", last_name: "yes")

    get "/api/v1/customers/find?created_at=#{customer_1.created_at}" 

    customer_response= JSON.parse(response.body)
    expect(customer_response["data"].class).to eq(Hash)
    expect(customer_response["data"].class).to_not eq(Array)

    expect(customer_response["data"]["id"]).to eq(customer_1.id.to_s)
    expect(customer_response["data"]["attributes"]["first_name"]).to eq(customer_1.first_name)
    expect(customer_response["data"]["attributes"]["last_name"]).to eq(customer_1.last_name)
  end

  it "it can find customer by params (:updated_at)" do 
    customer_1 = Customer.create!(first_name: "josh", last_name: "student", updated_at: "Thu, 30 Jan 2020 01:50:39")
    customer_2 = Customer.create!(first_name: "jon", last_name: "yep")
    customer_3 = Customer.create!(first_name: "billy", last_name: "yes")

    get "/api/v1/customers/find?updated_at=#{customer_1.updated_at}" 

    customer_response= JSON.parse(response.body)
    expect(customer_response["data"].class).to eq(Hash)
    expect(customer_response["data"].class).to_not eq(Array)

    expect(customer_response["data"]["id"]).to eq(customer_1.id.to_s)
    expect(customer_response["data"]["attributes"]["first_name"]).to eq(customer_1.first_name)
    expect(customer_response["data"]["attributes"]["last_name"]).to eq(customer_1.last_name)
  end

  xit "can find a random resource" do
    merchant_1 = Merchant.create!(name: "Johns Superstore")
    merchant_2 = Merchant.create!(name: "Sallys Superstore")
    merchant_3 = Merchant.create!(name: "Joes Superstore")
    merchant_4 = Merchant.create!(name: "Supers Superstore")

    get "/api/v1/merchants/random?updated_at=#{merchant_1.updated_at}"
    merchant_response = JSON.parse(response.body)

    expect(Merchant.find_rand.class).to eq(Merchant)
  end
end
