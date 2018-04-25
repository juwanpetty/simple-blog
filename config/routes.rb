Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations"}
  
  get 'welcome/index'
  root 'welcome#index'

  get 'about', to: 'welcome#about'

  devise_scope :user do 
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'registrations#new'
  end

  resources :posts
end
