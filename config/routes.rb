CsfTaskManager::Application.routes.draw do
  devise_for :users
  resource :user
  root :to => 'main#index'
  
  resources :goals
end
