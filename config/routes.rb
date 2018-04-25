Rails.application.routes.draw do
  resources :comments
  resources :todos
  resources :campaigns
  get 'dashboard/index'

  root to: "welcome#index"
  # devise_for :users
  devise_for :experts
  devise_for :novices
  get '/novices'    => 'dashboard#novice_users'
  get '/edit_status_novice'    => 'dashboard#edit_status_novice'
  put '/update_status'    => 'dashboard#update_status'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
