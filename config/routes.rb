Rails.application.routes.draw do
  root "starships#index"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :starships, only: [:new, :create, :index, :show] do 
    resources :crew_members, only: [:new, :create]
  end

  resources :crew_members, only: [:index]
end
