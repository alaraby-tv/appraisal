Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, skip: [:sessions, :registrations]
  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    root 'devise/sessions#new'
    get '/sign_in' => 'devise/sessions#new', as: :new_user_session
    post '/sign_in' => 'devise/sessions#create', as: :user_session
    delete '/sign_out' => 'devise/sessions#destroy', as: :destroy_user_session

    get 'users/new' => 'devise/registration#new', as: :new_user_registration
    post 'users' => 'devise/registration#create', as: :create_user_registration
    get 'users/edit' => 'devise/registrations#edit', as: :edit_user_registration
    put 'users' => 'devise/registrations#update', as: :user_registration
  end
end
