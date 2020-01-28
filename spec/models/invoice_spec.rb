require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe "relationships" do 
    it { should have_many :transactions}
    it { should have_many :invoice_items}
    it { should have_many(:items).through(:invoice_items) } #unsure 

    it {should belong_to :merchant}
    it {should belong_to :customer}
  end
end
