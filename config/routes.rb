Rails.application.routes.draw do
  resources :prospects
  root 'prospects#index'
end