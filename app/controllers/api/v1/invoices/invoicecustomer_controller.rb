
class Api::V1::Invoices::InvoicecustomerController < ApplicationController

  def show
    render json: CustomerSerializer.new(Invoice.find(params[:id]).customer) 
  end
end

