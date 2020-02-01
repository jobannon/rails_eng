class Api::V1::Invoices::InvoiceitemsController < ApplicationController
  def index
    render json: InvoiceItemsSerializer.new(Invoice.find(params[:id]).invoice_items) 
  end

  def show
    render json: ItemSerializer.new(Invoice.find(params[:id]).items) 
  end
end

