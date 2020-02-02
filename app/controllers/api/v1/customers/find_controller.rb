class Api::V1::Customers::FindController < ApplicationController
  def show
    render json: CustomerSerializer.new(Customer.find_by(find_params)) 
  end

  def index 
    render json: CustomerSerializer.new(Customer.find_all(find_params)) 
  end

  private

  def find_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end
