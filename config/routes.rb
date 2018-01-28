Rails.application.routes.draw do
  devise_for :users
  resources :prospects do
    resources :comments
  end
  root 'prospects#index'
end