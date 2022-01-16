Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'signup', to: 'customers#new', as: 'signup'
  get 'staff_login', to: 'sessions#staffnew', as: 'staff_login'
  get 'staff_logout', to: 'sessions#staffdestroy', as: 'staff_logout'
  post 'sessions/create', to:"sessions#staffcreate"
  

  resources :customers
  resources :sessions, only: [:new, :create, :destroy, :staffnew, :staffcreate, :staffdestroy]
  
  root "home#index"
end
