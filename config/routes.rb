Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  root to: 'pages#home'
  get '/produtos', to: 'pages#products', as: 'products'
  get '/conhecimento', to: 'pages#knowledge', as: 'knowledge'
  get '/users/signup', to: 'users/registrations#new', as: 'users/signup'

end
