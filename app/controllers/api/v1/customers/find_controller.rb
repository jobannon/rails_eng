class Api::V1::Customers::FindController < ApplicationController
  def show
    render json: CustomerSerializer.new(Customer.find_by(request.query_parameters)) 
  end

  def index 
    render json: CustomerSerializer.new(Customer.find_all(request.query_parameters)) 
  end
end
