CsfTaskManager::Application.routes.draw do
  devise_for :users, :controllers => { :sessions => "authentications" }
  resource :user
  root :to => 'main#index'
  match "/api/auth" => "main#auth"
  
  resources :goals do
    resources :exclusions
  end
  resources :roles
end
