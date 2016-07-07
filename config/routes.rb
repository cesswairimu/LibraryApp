Rails.application.routes.draw do

  get 'sessions/new'

 root 'static_pages#home'

  get 'about' => 'static_pages#about'

  get 'support' => 'static_pages#support'

  get 'signup' => 'users#new'

  post 'login' => 'sessions#create'
  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'
  resources :users
end
