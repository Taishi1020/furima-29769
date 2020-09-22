Rails.application.routes.draw do
  root to: "furimas#index"
  devise_for :users
  # get 'furimas/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :furimas, only: [:edit, :update]
end
