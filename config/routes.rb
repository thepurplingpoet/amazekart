Rails.application.routes.draw do
  
  resources :reviews
  get 'pages/home'
  get 'pages/help'
  get 'pages/about'
  get 'pages/contact'
  get 'pages/show_vertical'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  resources :products
  resources :categories
  resources :verticals
  resources :orders
  resources :wishlist
  get 'pages/seller'
  get 'pages/cart'
  get 'pages/checkout_success'
  get 'pages/profile'
  get 'cart/add' => 'cart#add'
end
