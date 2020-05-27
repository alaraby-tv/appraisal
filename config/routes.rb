Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :evaluations
      resources :groups
      resources :objectives
      resources :sections

      root to: "users#index"
    end
  resources :groups do
    resources :sections do
      resources :objectives
    end
  end
  root 'home#index'
  devise_for :users, skip: [:sessions, :registrations]
  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    root 'devise/sessions#new'
    get '/log_in' => 'devise/sessions#new', as: :new_user_session
    post '/log_in' => 'devise/sessions#create', as: :user_session
    delete '/log_out' => 'devise/sessions#destroy', as: :destroy_user_session

    get 'sign_up' => 'devise/registrations#new', as: :new_user_registration
    post 'users' => 'devise/registrations#create', as: :user_registration
    get 'users/edit' => 'devise/registrations#edit', as: :edit_user_registration
    put 'users' => 'devise/registrations#update'
  end
end
