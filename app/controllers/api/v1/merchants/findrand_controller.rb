class Api::V1::Merchants::FindrandController < ApplicationController
  def show
    render json: MerchantSerializer.new(Merchant.find_rand) 
  end
end
