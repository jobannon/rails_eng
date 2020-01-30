class Api::V1::InvoicesController < ApplicationController
  def index
    render json: InvoiceSerializer.new(Merchant.find(params[:merchant_id]).invoices) 
  end
end
