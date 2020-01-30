class InvoiceSerializer
  include FastJsonapi::ObjectSerializer
  # attributes :customer_id, :status, :created_at, :updated_at
  attributes :id  
end
