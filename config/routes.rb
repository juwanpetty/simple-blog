Rails.application.routes.draw do
  get 'welcome/index'
  root to: 'welcome#index'

  get 'about', to: 'welcome#about'

  resources :posts
end
