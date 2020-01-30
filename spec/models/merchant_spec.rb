require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe "relationships" do 
    it { should have_many :items}
    it { should have_many :invoices}

    xit { should have_many }
  end
  describe "class methods" do 
    it ".find_all" do
      merchant_1 = Merchant.create!(name: "Johns Superstore")
      merchant_2 = Merchant.create!(name: "Johns Superstore")
      merchant_3 = Merchant.create!(name: "Joes Superstore")

      collection = Merchant.find_all(name: "Johns Superstore")

      expect(collection.first.name).to eq("Johns Superstore")
      expect(collection.last.name).to eq("Johns Superstore")
      expect(collection.count).to eq(2)
    end

    it ".find_rand" do 
      merchant_1 = Merchant.create!(name: "Johns Superstore")
      merchant_2 = Merchant.create!(name: "Johns Superstore")
      merchant_3 = Merchant.create!(name: "Joes Superstore")

      expect(Merchant.find_rand.class).to eq(Merchant)
    end 
  end
end
