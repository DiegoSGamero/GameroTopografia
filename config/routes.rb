Rails.application.routes.draw do
  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions: 'admins/sessions'
  }
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root to: 'pages#home'
  get '/produtos', to: 'pages#products', as: 'products'
  get '/conhecimento', to: 'pages#knowledge', as: 'knowledge'


  get '/perfil', to: 'users#profile', as: 'user_profile'

  get '/propriedades', to: "properties#index", as: 'properties_index'
  resources :properties do
    collection do
      get 'search_property', to: 'properties#index'
    end
  end
end
