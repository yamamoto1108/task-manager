Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "boards#index"

  resources :boards do
    resources :lists, except: [:index, :show]
    resources :cards, except: [:index]
  end
end
