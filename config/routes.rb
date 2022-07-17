Rails.application.routes.draw do
  post "task_list_path", to: "tasks#create"
  post "/tasks/update", to: "tasks#update"
  root "task_lists#new"
  resources :tasks
  resources :task_lists
end
