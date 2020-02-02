class Api::V1::Invoices::FindController < ApplicationController

  def show
    render json: InvoiceSerializer.new(Invoice.find_by(find_params)) 
  end

  def index 
    render json: InvoiceSerializer.new(Invoice.find_all(find_params)) 
  end

  private 

  def find_params
    params.permit(:id, :invoice_id, :customer_id , :status, :updated_at, :created_at)
  end
end
