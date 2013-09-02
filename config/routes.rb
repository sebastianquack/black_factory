DarkFactory::Application.routes.draw do

	match '/tutorial' => 'home#tutorial'

	match 'challenges/designs' => 'challenges#designs_public_urlparam'
	match 'challenges/:id' => 'challenges#show_public', 'as' => 'challenge'
	match 'challenges/:id/designs' => 'challenges#designs_public'
	match 'designs/creator' => 'designs#creator', 'as' => 'creator'
	match 'designs/create' => 'designs#create_public'
	match 'designs/:id' => 'designs#show_public', 'as' => 'design'
	match 'designs/:id/vote' => 'designs#vote'
	match 'comments/create' => 'comments#create_public'
	match 'reward_codes/claim' => 'reward_codes#claim'
	match 'highscores' => 'reward_codes#highscores', 'as' => 'highscores'
	match 'images/upload_public' => 'images#create_public'
	match 'images/test' => 'images#test'
	match 'usernames' => 'username_scores#usernames_public'

scope "admin" do
	get "/", :controller => :admin, :action => :index
	resources :vote_cookies # watch out: singular helper methods are generated with cooky, i.e. edit_vote_cooky_path
  	resources :username_cookies # watch out: singular helper methods are generated with cooky
	resources :username_scores
  	resources :designs
	resources :challenges
  	resources :comments
  	resources :media_links
  	resources :images
	match 'reward_codes/generate_form' => 'reward_codes#generate_form'
	match 'reward_codes/generate' => 'reward_codes#generate'
  	resources :reward_codes
  end

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
  root :to => 'home#welcome'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
