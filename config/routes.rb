Rails.application.routes.draw do
  devise_for :users
  root to: "furimas#index"
  # get 'furimas/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :furimas do
  end
end
