Rails.application.routes.draw do
  root "starships#index"
  resources :starships, only: [:index, :show, :new, :create]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
