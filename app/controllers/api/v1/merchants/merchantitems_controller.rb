class Api::V1::Merchants::MerchantitemsController < ApplicationController
  def index
    render json: ItemSerializer.new(Merchant.find(params[:id]).items.all) 
  end
end
