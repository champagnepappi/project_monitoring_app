Rails.application.routes.draw do
  get 'projects/new'

  get 'password_resets/new'

  get 'password_resets/edit'

  root 'pages#home'
  get 'users/new'
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'approve' => 'projects#approve'
  resources :users
  resources :projects
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
