Rails.application.routes.draw do
  get 'events/index'

  get 'events/new'

  get 'events/show'

  get 'events/create'

  get 'events/update'

  get 'books/index'

  get 'books/new'

  get 'books/show'

  get 'books/create'

  get 'books/update'

  devise_for :users
  resources :tasks
  resources :informs
  resources :addresses
  resources :articles
  resources :events
  resources :books
  resources :genres

  root 'welcome#index' # root_path

end
