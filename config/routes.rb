Rails.application.routes.draw do
  get "/tasks/show", to: "tasks#show"
  post "task_list_path", to: "tasks#create"
  post "/tasks/update", to: "tasks#update"
  root "task_lists#new"
  resources :tasks
  resources :task_lists
  resources :comments
end
