Rails.application.routes.draw do
  devise_for :lawyers
  ActiveAdmin.routes(self)
  devise_for :users, ActiveAdmin::Devise.config
  resources :questions do
    resources :answers 
    
  end 
  resources :articles
  
  root 'welcome#index'
end
