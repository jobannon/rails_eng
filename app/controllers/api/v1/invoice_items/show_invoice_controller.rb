class Api::V1::InvoiceItems::ShowInvoiceController < ApplicationController

  def show
    invoice_item = InvoiceItem.find(params["invoice_item_id"])
    render json: InvoiceSerializer.new(invoice_item.invoice) 
  end
end

