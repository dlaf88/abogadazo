Rails.application.routes.draw do
  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  devise_for :accounts, controllers: {
    registrations: 'accounts/registrations',
    :omniauth_callbacks => 'accounts/omniauth_callbacks'
    }
  #devise_for :lawyers
  #resources :articles
  resources :questions
  resources :lawyer_profiles
  get '/terms', to: 'static_pages#terms'
  get '/about', to: 'static_pages#about'
  get '/pay', to: 'static_pages#pay'
  root to: "welcome#show"
  get'/apply', to: 'static_pages#apply'
  get'import', to: 'welcome#import'
  resources :attorney_profiles do
    collection {post :import}
  end 
end
