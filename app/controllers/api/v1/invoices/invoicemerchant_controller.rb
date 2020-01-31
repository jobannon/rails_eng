class Api::V1::Invoices::InvoicemerchantController < ApplicationController

  def show
    render json: MerchantSerializer.new(Invoice.find(params[:id]).merchant) 
  end
end

