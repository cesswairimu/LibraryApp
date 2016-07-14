Rails.application.routes.draw do

  get 'books/add'

  root 'static_pages#home'

  get 'about' => 'static_pages#about'

  get 'support' => 'static_pages#support'

  get 'signup' => 'users#new'

  get 'login' => 'sessions#new'
  get 'index' => 'users#index'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  resources :users
  resources :account_activations, only:[:edit]
  resources :password_resets, only:[:new, :create, :edit, :update]
end
