Rails.application.routes.draw do


  root 'static_pages#home'

  get 'about' => 'static_pages#about'

  get 'support' => 'static_pages#support'

  get 'signup' => 'users#new'

  get 'login' => 'sessions#new'
  get 'index' => 'users#index'

  post 'login' => 'sessions#create'
  resources :bids

  delete 'logout' => 'sessions#destroy'
  get 'book' => 'books#show'
  resources :users do
    member do
      get :book, :borrower
    end
  end
  get 'borrow' => 'users#borrow'


  resources :account_activations, only:[:edit]
  resources :password_resets, only:[:new, :create, :edit, :update]
  resources :books do
  member do
    get :book, :borrower
  end
end
  resources :relationships
end
