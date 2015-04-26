Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, ActiveAdmin::Devise.config
  resources :questions do
    resources :answers 
    
  end 
  resources :articles
  
  root 'welcome#index'
end
