Rails.application.routes.draw do
  get 'lecturers/new'

  get 'projects/new'



  root 'pages#home'
  get 'users/new'
  
  get 'loginlec' => 'sessions#new_lec'
  post 'loginlec' => 'sessions#createlec'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'approve' => 'projects#approve'
  get 'undoapproval' => 'projects#undo_approval'
  get 'reject'  => 'projects#reject'
  get 'supervisor' => 'lecturers#supervisor'
  get 'assign' => 'users#assign'
  resources :users
  resources :lecturers
  resources :projects
  resources :bids
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
