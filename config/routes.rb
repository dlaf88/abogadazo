Rails.application.routes.draw do
  devise_for :lawyers 
  ActiveAdmin.routes(self)
  devise_for :users, ActiveAdmin::Devise.config
  resources :questions do
    resources :answers 
    
  end 
  resources :articles
  resources :lawyers do
    resources :lawyer_profiles
  end 

  
  root 'welcome#index'
end
