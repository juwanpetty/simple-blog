Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  get 'about', to: 'welcome#about'
  # get 'signup', to: 'users#new' 
  get 'login', to: 'sessions#new'
  
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :posts
  resources :users
end
