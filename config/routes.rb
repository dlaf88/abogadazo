Rails.application.routes.draw do
  
  # namespace :admin do
  #   DashboardManifest::DASHBOARDS.each do |dashboard_resource|
  #     resources dashboard_resource
  #   end

  #   root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  # end

   devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    :omniauth_callbacks => 'users/omniauth_callbacks'
    }
  #devise_for :lawyers
  resources :firms
  resources :articles do 
    collection do 
      get 'search'
    end 
  end 
  resources :questions
  resources :lawyer_profiles
  resources :law_categories do
    #collection {post :import}
  end 
  resources :practice_areas do
    #collection {post :import}
  end 
  get '/terms', to: 'static_pages#terms'
  get '/about', to: 'static_pages#about'
  get '/pay', to: 'static_pages#pay'
  get '/map', to: 'welcome#maps'
  root to: "welcome#show"
  get'/apply', to: 'static_pages#apply'
  #get'import', to: 'welcome#import'
  resources :attorney_profiles do
    #collection {post :import}
  end 
end
