Meta::Application.routes.draw do


  resources :headers

  resources :units

  resources :datasets

  resources :users 
  
  resources :sessions,      only: [:new, :create, :destroy]

  get 'tags/:tag', to: 'photos#index', as: :tag
  get 'tags_user/:tags_user', to: 'users#show', as: :tags_user

  # root to: 'photos#index'
  
  root to: 'static_pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
end
