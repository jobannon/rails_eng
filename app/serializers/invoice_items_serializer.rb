class InvoiceItemsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :item_id, :invoice_id, :quantity, :unit_price
end
