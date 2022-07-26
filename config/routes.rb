Rails.application.routes.draw do
  root 'starships#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # resources :starships
  resources :starships, only: [:index, :show]
end
