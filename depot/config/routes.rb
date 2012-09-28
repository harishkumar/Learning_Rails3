Depot::Application.routes.draw do 
 
  resources :products

  resources :users

  match "cart/my_cart_page"=>"cart#my_cart_page"
  match "cart/display_total"=>"cart#display_total"
  match "buyer/add_to_cart"=>"buyer#add_to_cart"
  match "orders/orders_list"=>"orders#orders_list"
  match "orders/approve_orders"=>"orders#approve_orders"
  match "orders/approval"=>"orders#approval"
  get "buyer/catalog"

#  get "misc/new"
#  post "misc/new"
#  get "misc/edit"
#  post "misc/edit"
#  get "misc/create_files"
#  post "misc/create_files"
#  match "misc/show_file"=>"misc#show_file"
#  match "misc/edit_file"=>"misc#edit_file"
#  match "misc/delete_file"=>"misc#delete_file"
#  match "misc/delete_role"=>"misc#delete_role"


#  match"misc/login"=>"misc#login"
#  match"misc/logout"=>"misc#logout"

  resources :misc

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'misc#login'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
