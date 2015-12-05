Rails.application.routes.draw do
  # Authentication

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  # OAuth

  get '/auth/github' => 'auth#github', as: 'github_login'
  get '/auth/github/callback' => 'sessions#create', as: 'github_callback'

  # Application

  root 'static#index'

  resources :repos, except: :edit do
    resources :issues, only: [:new, :create]
    resources :widgets, only: [:edit, :update]
    patch 'default_widget' => 'widgets#update_default', as: 'update_default_widget'
    get 'feedback' => 'repos#feedback', as: 'feedback'
  end
end
