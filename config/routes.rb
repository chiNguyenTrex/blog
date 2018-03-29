Rails.application.routes.draw do
  resources :tasks
  resources :informs

  root 'welcome#index' # root_path

  get "welcome/hello"
  get "welcome/fix_hello"
  get "welcome/welcome"
  get "welcome/another_hello"
  get "welcome/demo_route", to: "welcome#demo_route" #welcome_demo_route_path
  # OR get "welcome/demo_route" => "welcome#demo_route"

  resources :articles
  resources :events
  resources :books
end
