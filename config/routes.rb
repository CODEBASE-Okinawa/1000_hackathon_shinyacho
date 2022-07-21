Rails.application.routes.draw do
  get "/tasks/show", to: "tasks#show"
  post "task_list_path", to: "tasks#create"
  post "/tasks/update", to: "tasks#update"
  post "/comments/update", to: "comments#update"
  root "task_lists#new"
  resources :tasks
  resources :task_lists
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  resources :comments
end
