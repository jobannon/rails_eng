class Api::V1::InvoiceItems::FindController < ApplicationController

  def show
    render json: InvoiceItemsSerializer.new(InvoiceItem.find_by(request.query_parameters)) 
  end

  def index 
    render json: InvoiceItemsSerializer.new(InvoiceItem.find_all(request.query_parameters)) 
  end
end
