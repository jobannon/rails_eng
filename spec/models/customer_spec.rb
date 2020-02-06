require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do 
    it {should have_many :invoices}
    it {should have_many :transactions}
  end
end
