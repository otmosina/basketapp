Basketapp::Application.routes.draw do
  
 

  

  #scope '/admin' do
  match '/goods' => "admin/goods#index_for_user"
  match '/goods/buy' => "admin/goods#buy", :method => :post
  namespace 'admin' do
    resources :goods#, :except => :index
    #match '/goods' => "goods#index_admin", :as => 'admin_goods_index'
  end 

  #resources :goods, :only => :index_for_user do
 #  member do 
  #    post :buy
  #  end  
  #end     

  match 'login' => 'user_sessions#new', :as => 'login'
  match 'logout' => 'user_sessions#destroy', :as => 'logout'

  resources :user_sessions

  root :to => 'index#index'

  resources :users do 
    member do 
      post :add_some_money
    end 
  end  

  match 'basket' => 'baskets#current_basket'

  match 'basket/delete_all_goods' => 'baskets#delete_all_goods', :via => :post, :as => 'delete_all_goods'   

  #get "index/index"

  get "index/show"



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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
