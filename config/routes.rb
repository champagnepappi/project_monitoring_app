Rails.application.routes.draw do
  get 'payments/new'

  get 'lecturers/new'

  get 'projects/new'



  root 'pages#home'
  get 'users/new'
  get 'help' => 'pages#help'
  
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
  resources :lecturers do
    member do
      get :supervising
    end
  end
  resources :projects
  resources :messages, only: [:create,:show, :destroy]
  resources :replies, only: [:new, :create, :destroy, :show]
  resources :bids
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :relationships, only: [:create, :destroy]
  resources :payments, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
