Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  resources :questions do
    resources :answers 
    
  end 
  
  root 'welcome#index'
end
