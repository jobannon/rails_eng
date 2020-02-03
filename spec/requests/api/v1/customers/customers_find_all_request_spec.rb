require "rails_helper"

RSpec.describe "Customer API Finder methods" do 
  it "it can find customer by params (:id)" do 
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")
    customer_2 = Customer.create!(first_name: "jon", last_name: "yep")
    customer_3 = Customer.create!(first_name: "billy", last_name: "yes")

    get "/api/v1/customers/find_all?id=#{customer_1.id}"
     
    customer_response= JSON.parse(response.body)

    expect(customer_response["data"].class).to eq(Array)
    expect(customer_response["data"].class).to_not eq(Hash)
    expect(customer_response["data"].count).to eq(1)

    expect(customer_response["data"][0]["id"]).to eq(customer_1.id.to_s)
    expect(customer_response["data"][0]["attributes"]["first_name"]).to eq(customer_1.first_name)
    expect(customer_response["data"][0]["attributes"]["last_name"]).to eq(customer_1.last_name)
  end

  it "it can find customer by params (:first name)" do 
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")
    customer_2 = Customer.create!(first_name: "jon", last_name: "yep")
    customer_3 = Customer.create!(first_name: "billy", last_name: "yes")


    get "/api/v1/customers/find_all?first_name=#{customer_1.first_name}"

    customer_response= JSON.parse(response.body)
    expect(customer_response["data"].class).to eq(Array)
    expect(customer_response["data"].class).to_not eq(Hash)
    expect(customer_response["data"].count).to eq(1)

    expect(customer_response["data"][0]["id"]).to eq(customer_1.id.to_s)
    expect(customer_response["data"][0]["attributes"]["first_name"]).to eq(customer_1.first_name)
    expect(customer_response["data"][0]["attributes"]["last_name"]).to eq(customer_1.last_name)
  end

  it "it can find customer by params (:lastname)" do 
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")
    customer_2 = Customer.create!(first_name: "jon", last_name: "yep")
    customer_3 = Customer.create!(first_name: "billy", last_name: "yes")


    get "/api/v1/customers/find_all?last_name=#{customer_1.last_name}"

    customer_response= JSON.parse(response.body)

    expect(customer_response["data"].class).to eq(Array)
    expect(customer_response["data"].class).to_not eq(Hash)
    expect(customer_response["data"].count).to eq(1)

    expect(customer_response["data"][0]["id"]).to eq(customer_1.id.to_s)
    expect(customer_response["data"][0]["attributes"]["first_name"]).to eq(customer_1.first_name)
    expect(customer_response["data"][0]["attributes"]["last_name"]).to eq(customer_1.last_name)
  end
   
  it "it can find customer by params (:created_at)" do 
    customer_1 = Customer.create!(first_name: "josh", last_name: "student", created_at: "Thu, 30 Jan 2020 01:50:39")
    customer_2 = Customer.create!(first_name: "jon", last_name: "yep")
    customer_3 = Customer.create!(first_name: "billy", last_name: "yes")

    get "/api/v1/customers/find_all?created_at=#{customer_1.created_at}" 

    customer_response= JSON.parse(response.body)
    expect(customer_response["data"].class).to eq(Array)
    expect(customer_response["data"].class).to_not eq(Hash)
    expect(customer_response["data"].count).to eq(1)

    expect(customer_response["data"][0]["id"]).to eq(customer_1.id.to_s)
    expect(customer_response["data"][0]["attributes"]["first_name"]).to eq(customer_1.first_name)
    expect(customer_response["data"][0]["attributes"]["last_name"]).to eq(customer_1.last_name)
  end

  it "it can find customer by params (:updated_at)" do 
    customer_1 = Customer.create!(first_name: "josh", last_name: "student", updated_at: "Thu, 30 Jan 2020 01:50:39")
    customer_2 = Customer.create!(first_name: "jon", last_name: "yep")
    customer_3 = Customer.create!(first_name: "billy", last_name: "yes")

    get "/api/v1/customers/find_all?updated_at=#{customer_1.updated_at}" 

    customer_response= JSON.parse(response.body)

    expect(customer_response["data"].class).to eq(Array)
    expect(customer_response["data"].class).to_not eq(Hash)
    expect(customer_response["data"].count).to eq(1)

    expect(customer_response["data"][0]["id"]).to eq(customer_1.id.to_s)
    expect(customer_response["data"][0]["attributes"]["first_name"]).to eq(customer_1.first_name)
    expect(customer_response["data"][0]["attributes"]["last_name"]).to eq(customer_1.last_name)
  end
end
