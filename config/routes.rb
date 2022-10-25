Rails.application.routes.draw do
  root 'starships#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :starships, only: [:index, :show, :new, :create] do 
    resources :members, only: [:create]
  end
end
