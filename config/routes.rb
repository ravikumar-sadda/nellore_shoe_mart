NelloreShoeMart::Application.routes.draw do
  
  get "gallery/index"
  get "gallery/checkout"
  get "gallery/purchase_complete"
  get "gallery/search"
  post "gallery/index"
  post "gallery/checkout"
  get "gallery/purchase_complete"
  get "gallery/search"
  resources :line_items

  resources :carts

  resources :stores
  

  get "admin/login"
  post "admin/login"
  post "admin/logout"
  get "admin/logout"
  get "account/signup"
  get "account/login"
  get "account/forget_password"
  get "account/reset_password"
  get "account/index"
  get "account/logout"
  post "account/signup"
  post "account/login"
  post "account/forget_password"
  post "account/reset_password"
  post "account/index"
  post "gallery/search"
  get "gallary/checkout"
  


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
