Rails.application.routes.draw do
  
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
  get 'pages/seller'
end
