Rails.application.routes.draw do
  post "task_list_path", to: "tasks#create"
  root "task_lists#new"
  resources :tasks
  resources :task_lists
end
