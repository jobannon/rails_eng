class Api::V1::InvoiceItems::FindController < ApplicationController

  def show
    render json: InvoiceItemsSerializer.new(InvoiceItem.find_by(find_params)) 
  end

  def index 
    render json: InvoiceItemsSerializer.new(InvoiceItem.find_all(find_params)) 
  end

  def find_params
    params.permit(:id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
  end
end
