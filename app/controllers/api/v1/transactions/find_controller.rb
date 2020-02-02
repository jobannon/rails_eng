
class Api::V1::Transactions::FindController < ApplicationController
  def show
    render json: TransactionSerializer.new(Transaction.find_by(find_params)) 
  end

  def index 
    render json: TransactionSerializer.new(Transaction.find_all(find_params)) 
  end

  def find_params
    params.permit(:id, :invoice_id, :credit_card_number, :result, :updated_at, :created_at)
  end

end
