Rails.application.routes.draw do
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

  root 'welcome#index'

end
