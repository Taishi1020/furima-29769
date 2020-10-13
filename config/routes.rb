Rails.application.routes.draw do
  get 'shipping/address'
  post 'purchase/infomations'
  devise_for :users
  root to: "items#index"
   
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   resources :items do
    resources :purchases
   end
   resources :shipping_address
end
