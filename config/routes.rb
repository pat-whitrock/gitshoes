Rails.application.routes.draw do

  devise_for :users, :controllers => {:omniauth_callbacks => 'users/omniauth_callbacks'}
  devise_scope :user do 
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  root 'static#index'

  # get 'issues' => 'issues#index'
  get 'repos/:id/issues/new' => 'issues#new', as: 'new_issue'
  post 'repos/:id/issues' => 'issues#create', as: 'create_issue'
  # get 'issues/:id' => 'issues#show'
  # get 'issues/:id/edit' => 'issues#edit'
  # patch 'issues/:id' => 'issues#update'
  # delete 'issues/:id' => 'issues#destroy'

  get 'repos/new' => 'repos#new', as: 'new_repo'
  patch 'repos/:id' => 'repos#update'
  get 'repos/:id' => 'repos#show', as: 'repo'
  get 'repos/:id/preview' => 'repos#preview', as: 'preview_repo'
  post 'repos' => 'repos#create'
  get 'repos' => 'repos#index'
  delete 'repos/:id' => 'repos#destroy', as: 'delete_repo'

  get 'repos/:id/widget/edit' => 'widgets#edit', as: 'edit_widget'
  patch 'repos/:id/widget' => 'widgets#update'

  get '/auth/github' => 'auth#github', as: 'github_login'
  get '/auth/github/callback' => 'sessions#create', as: 'github_callback'

  get 'repos/:id/feedback' => 'repos#feedback', as: 'feedback'

end
