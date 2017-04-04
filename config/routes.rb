Rails.application.routes.draw do
  get 'lecturers/new'

  get 'projects/new'



  root 'pages#home'
  get 'users/new'
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'approve' => 'projects#approve'
  get 'reject'  => 'projects#reject'
  resources :users
  resources :lecturers
  resources :projects
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  get 'new_lec' => 'users#new_lec'
  # post 'new_lec' => 'users#new_lec'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
