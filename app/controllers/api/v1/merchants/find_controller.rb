class Api::V1::Merchants::FindController < ApplicationController
  def show
    render json: MerchantSerializer.new(Merchant.find_by(find_params)) 
  end

  def index 
    render json: MerchantSerializer.new(Merchant.find_all(find_params)) 
  end

  def find_params
    params.permit(:id, :name, :created_at, :updated_at)
  end

end
