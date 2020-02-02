class Api::V1::Merchants::MostRevenueController < ApplicationController
  def index
    result = Merchant.top_merchant(best_params["quantity"].to_i)
    render json: MerchantSerializer.new(result) 
  end

  private
  
  def best_params
    params.permit(:id, :quantity)
  end
end
