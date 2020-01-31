class Api::V1::Invoices::FindController < ApplicationController

  def show
    binding.pry
    render json: InvoiceSerializer.new(Invoice.find_by(request.query_parameters)) 
  end

  def index 
    render json: InvoiceSerializer.new(Invoice.find_all(request.query_parameters)) 
  end
end
