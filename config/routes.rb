Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do  
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
      end

      resources :merchants, only: [:index, :show] do 
        resources :items, only: [:index]
      end
      get "/merchants/most_revenue", to: "merchants#most_revenue"  

    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
