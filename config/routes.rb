MobSyncBackend::Application.routes.draw do
  resources :mobs
  resources :users

  root 'users#index'
  post 'login', to: 'users#login'

  post 'usersearch', to: 'users#search'
  post 'mymobs', to: 'mobs#mymobs'
  post 'confirm', to: 'mobs#confirm'
end
