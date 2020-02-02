
class Api::V1::Invoices::InvoicecustomerController < ApplicationController

  def show
    render json: CustomerSerializer.new(Invoice.find(params[:invoice_id]).customer) 
  end
end

