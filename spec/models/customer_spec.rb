require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do 
    xit {should have_many :invoices}
    xit {should have_many :transactions}
  end
end
