Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      
      namespace :merchants do  
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
        get '/random', to: "findrand#show"

        get '/:id/items', to: "merchantitems#index"
      end

      namespace :invoices do 
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"

        get '/:id/invoice_items', to: "invoiceitems#index"
        get '/:id/items', to: "invoiceitems#show"
        get '/:id/customer', to: "invoicecustomer#show" #is this right? 
        get '/:id/merchant', to: "invoicemerchant#show"
      end

      resources :merchants, only: [:index, :show] do 
        resources :items, only: [:index]
        resources :invoices, only: [:index]
      end
      resources :invoices, only: [:index, :show] do 
        resources :transactions, only: [:index]
        resources :invoice_items, only: [:index]
      end
      resources :invoice_items, only: [:index, :show] do
      end

      get "/merchants/most_revenue", to: "merchants#most_revenue"  

    end
  end
end
