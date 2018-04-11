Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations"}
  get 'welcome/index'
  root 'welcome#index'

  get 'about', to: 'welcome#about'

  resources :posts
end
