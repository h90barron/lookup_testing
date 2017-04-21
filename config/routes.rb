Rails.application.routes.draw do
  get     '/login',     to: "sessions#new"
  post    '/login',     to: "sessions#create"
  delete  '/logout',    to: "sessions#destroy"
  post    '/copier_requests/:id',    to: "copier_requests#accept"
  
  get     '/imports',        to: "imports#new"
  post    '/imports',        to: "imports#create"
  get     '/imports/export_copiers', to: "imports#export_copiers", defaults: { format: 'csv' }
  
  
  # import routes, clean up
  get   '/imports/new_copier',            to: "imports#new_copier"
  post  '/imports/copiers',               to: "imports#import_copiers"
  get   '/imports/export_copiers',        to: "imports#export_copiers", defaults: { format: 'csv' }
  
  get   '/imports/new_harness',           to: "imports#new_harness"
  post  '/imports/harnesses',             to: "imports#import_harnesses"
  get   '/imports/new_vendor_harness',    to: "imports#new_vendor_harness"
  post  '/imports/vendor_harnesses',      to: "imports#import_vendor_harnesses"
  get   '/imports/new_oem',               to: "imports#new_oem"
  post  '/imports/oems',                  to: "imports#import_oems"
  get   '/imports/new_matrix_mfd',        to: "imports#new_matrix_mfd"
  post  '/imports/matrix_mfds',           to: "imports#import_matrix_mfds"
  
  
  
  
  get     '/static_pages/front_door',     to: "static_pages#front_door"
  post    '/static_pages/grant_access',   to: "static_pages#grant_access"
  get     '/static_pages/about',          to: "static_pages#about"
  
  get     '/matrix_mfds',                 to: "matrix_mfds#show"
  
  #using post above since post method to that route is not being used
  
  resources :copier_requests
  resources :oems
  
  resources :copiers
  
  get     '/signup',    to: 'users#new'
  root    'copiers#index'
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
