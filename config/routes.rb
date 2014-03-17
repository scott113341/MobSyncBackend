MobSyncBackend::Application.routes.draw do
  resources :mobs
  resources :users

  root 'users#index'
  post 'login', to: 'users#login'
end
