class Api::V1::MerchantsController < ApplicationController

  def index
    render json: MerchantSerializer.new(Merchant.all) 
  end

  def show 
    merchant = Merchant.find(params[:id])
    render json: MerchantSerializer.new(merchant)
 end

  def most_revenue
    result = Merchant.joins(:invoice_items).select("items.*, sum(invoice_items.quantity as quantity").group(:id).order("quantity desc").limit(params[:quantity])
  end
end
