Rails.application.routes.draw do

  namespace :admin do
    root "users#index"
    resources :users
  end

  devise_for :users
  resources :tasks
  resources :informs
  resources :addresses
  resources :articles do
    resources :comments
  end
  resources :events do
    resources :comments
  end
  resources :books do
    resources :comments
  end
  resources :genres

  root 'dashboard#index'

end
