class Api::V1::Merchants::FindController < ApplicationController
  def show
    render json: MerchantSerializer.new(Merchant.find_by(request.query_parameters)) 
  end

  def index 
##pull our cohntroller logic
    render json: MerchantSerializer.new(Merchant.where(request.query_parameters)) 
    # render json: MerchantSerializer.new(Merchant.find(request.query_parameters)) 
  end
end
