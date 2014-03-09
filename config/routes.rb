MobSyncBackend::Application.routes.draw do
  resources :mobs

  resources :users

  root 'users#index'
end
