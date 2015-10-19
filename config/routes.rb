Rails.application.routes.draw do
  devise_for :lawyers
  ActiveAdmin.routes(self)
  devise_for :users, ActiveAdmin::Devise.config
  resources :questions do
    resources :answers     
  end 
  resources :articles
  resources :lawyer_profiles
  get '/terms', to: 'static_pages#terms'
  root to: "welcome#show"
end
