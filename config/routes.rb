Rails.application.routes.draw do
 root 'static_pages#home'

  get 'about' => 'static_pages#about'

  get 'support' => 'static_pages#support'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
