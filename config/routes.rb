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
  get '/clientes', to: 'users#index', as: 'user_index'
  resources :users do
    collection do
      delete 'delete_photo/:photo_id', to: 'users#delete_photo', as: 'delete_photo'
      get 'search_user', to: 'users#index'
      patch 'update_photos', to: 'users#update_photos'
    end
  end
  get '/users/:id/photos', to: 'users#show_photos', as: 'user_photos'


  get '/propriedades', to: 'properties#index', as: 'properties_index'
  resources :properties do
    collection do
      get 'search_property', to: 'properties#index'
    end
  end

  get '/orcamento', to: 'contact#new', as: 'new_contact'
  post '/orcamento', to: 'contact#create', as: 'create_contact'

end
