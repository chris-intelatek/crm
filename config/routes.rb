Rails.application.routes.draw do
  match '/users',     to: 'users#index',  via: 'get'
  match '/users/:id', to: 'users#show',   via: 'get'

  resources :users

  devise_for :users, :controllers => { registrations: 'registrations' }, :path_prefix => 'd'
  resources :prospects do
    resources :comments
  end
  root 'prospects#index'
end