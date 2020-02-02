Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :merchants do  
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
      end
      namespace :invoices do 
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
      end
      namespace :customers do 
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
      end
      namespace :invoice_items do 
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
      end

      resources :merchants, only: [:index, :show] do 
        get '/invoices', to: "merchants/merchantinvoices#index"
        get '/items', to: "merchants/merchantitems#index"
      end
      resources :invoices, only: [:index, :show] do 
        get '/invoice_items', to: "invoices/invoiceitems#index"
        get '/items',         to: "invoices/invoiceitems#show"
        get '/customer',      to: "invoices/invoicecustomer#show" #is this right? 
        get '/merchant',      to: "invoices/invoicemerchant#show"
        get '/transactions',  to: "invoices/invoicetransactions#show"
      end
      resources :invoice_items, only: [:index, :show] do
        get '/invoice', to: "invoice_items/show_invoice#show"
        get '/item', to: "invoice_items/show_item#show"
      end
      resources :customers, only: [:index, :show] do
        get '/invoices', to: "customers/invoices#index"
        get '/invoices', to: "customers/transactions#index"
      end

      get "/merchants/most_revenue", to: "merchants#most_revenue"  

    end
  end
end
