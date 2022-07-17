Rails.application.routes.draw do
  post "task_list_path", to: "tasks#create"
  root "task_lists#new"
  resources :tasks
  resources :task_lists
  # get  '/help',    to: 'static_pages#help'
  # get  '/about',   to: 'static_pages#about'
  # get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  resources :users
end
