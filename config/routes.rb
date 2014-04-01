Rails.application.routes.draw do

  # get 'issues' => 'issues#index'
  get 'issues/new' => 'issues#new', as: 'new_issue'
  post 'issues' => 'issues#create'
  # get 'issues/:id' => 'issues#show'
  # get 'issues/:id/edit' => 'issues#edit'
  # patch 'issues/:id' => 'issues#update'
  # delete 'issues/:id' => 'issues#destroy'

  get 'repos/new' => 'repos#new', as: 'new_repo'
  get 'repos/:id/edit' => 'repos#edit'
  patch 'repos/:id' => 'repos#update'
  get 'repos/:id' => 'repos#show', as: 'repo'
  post 'repos' => 'repos#create'
  get 'repos' => 'repos#index'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
