
class Api::V1::TransactionsController < ApplicationController

  def index 
    render json: TransactionsSerializer.new(Transaction.all)
  end

  def show
    transaction = Transaction.find(params[:id])
    render json: TransactionsSerializer.new(transaction)
  end
end
