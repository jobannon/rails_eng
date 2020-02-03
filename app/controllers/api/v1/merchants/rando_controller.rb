class Api::V1::Merchants::RandoController < ApplicationController
  def show
    rand_merchant = Merchant.find_rand
    render json: MerchantSerializer.new(rand_merchant) 
  end

  def find_params
    params.permit(:id, :name, :created_at, :updated_at)
  end

end
