Rails.application.routes.draw do

	namespace :api do
	  get :csrf, to: 'csrf#index'
	end

	devise_for :users, controllers: { sessions: 'sessions' }

	# Not working. current returns null
	# devise_scope :user do
	# 	get "sessions/current" => "sessions#current"
	# end

	resources :users,  :only => [:show]
	resources :workshops, :except => [:edit, :new]
	resources :speakers, :except => [:edit, :new]
	resources :guests, :except => [:edit, :new]
	resources :hosts, :except => [:edit, :new]
	resources :registrations, :except => [:edit, :new]


	# routes for admin interface
	get     'admin/speakers'      => 'speakers#index'
	post    'admin/speakers'      => 'speakers#create'
	put     'admin/speaker'       => 'speakers#update'
	delete  'admin/speaker'       => 'speakers#destroy'

	get     'admin/workshops'     => 'workshops#index'
	post    'admin/workshops'     => 'workshops#create'
	put     'admin/workshop'      => 'workshops#update'
	delete  'admin/workshop'      => 'workshops#destroy'

	get     'admin/registrations' => 'registrations#index'
	post    'admin/registrations' => 'registrations#create'
	put     'admin/registration'  => 'registrations#update'
	delete  'admin/registration'  => 'registrations#destroy'

	get     'admin/guests'        => 'guests#index'
	post    'admin/guests'        => 'guests#create'
	put     'admin/guest'         => 'guests#update'
	delete  'admin/guest'         => 'guests#destroy'

	get     'admin/hosts'         => 'hosts#index'
	post    'admin/hosts'         => 'hosts#create'
	put     'admin/host'          => 'hosts#update'
	delete  'admin/host'          => 'hosts#destroy'

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
