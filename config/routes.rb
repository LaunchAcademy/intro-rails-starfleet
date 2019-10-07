Rails.application.routes.draw do
  root "starships#index"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :starships, only: [:index, :show, :new, :create]

end
