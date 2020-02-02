
class Api::V1::Transactions::InvoiceController < ApplicationController
  def show
    render json: InvoiceSerializer.new(Transaction.find_by(find_params).invoice) 
  end

  def find_params
    params.permit(:id, :invoice_id, :credit_card_number, :result, :updated_at, :created_at)
  end

end
