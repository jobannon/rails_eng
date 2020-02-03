
class Api::V1::Invoices::InvoicetransactionsController < ApplicationController

  def show
    render json: TransactionSerializer.new(Invoice.find(params[:invoice_id]).transactions) 
  end
end

