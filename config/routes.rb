Rails.application.routes.draw do
  root 'tasks#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :tasks
  resources :users, only: [:new, :create, :show, :destroy, :edit, :update]
end
