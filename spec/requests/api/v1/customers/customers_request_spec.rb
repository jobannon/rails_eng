
require "rails_helper"

RSpec.describe "Customers API" do 

  it "get get record of a single customer" do 
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")

    get "/api/v1/customers/#{customer_1.id}"
     
    show_customer = JSON.parse(response.body)

    expect(show_customer["data"].class).to eq(Hash)
    expect(show_customer["data"].class).to_not eq(Array)
    expect(show_customer["data"]["id"]).to eq(customer_1.id.to_s)
    
    expect(show_customer["data"]["attributes"]["first_name"]).to eq(customer_1.first_name)
    expect(show_customer["data"]["attributes"]["last_name"]).to eq(customer_1.last_name)
  end

  it "sends a list of customers (customers index)" do 
    customer_1 = Customer.create!(first_name: "josh", last_name: "student")
    customer_2 = Customer.create!(first_name: "jon", last_name: "yep")
    customer_3 = Customer.create!(first_name: "billy", last_name: "yes")

    get '/api/v1/customers'

    expect(response).to be_successful

    customers = JSON.parse(response.body)

    expect(customers["data"][0]["attributes"]["id"]).to eq(customer_1.id)
    expect(customers["data"][1]["attributes"]["id"]).to eq(customer_2.id)
    expect(customers["data"][2]["attributes"]["id"]).to eq(customer_3.id)
    expect(customers["data"].count).to eq(3)
  end
end
