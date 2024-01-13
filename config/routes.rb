Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Pages routes
  root to: 'pages#home'
  get '/produtos', to: 'pages#products', as: 'products'
  get '/conhecimento', to: 'pages#knowledge', as: 'knowledge'
end
