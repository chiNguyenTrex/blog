Rails.application.routes.draw do
  get 'addresses/index'

  get 'addresses/new'

  get 'addresses/edit'

  get 'addresses/show'

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
