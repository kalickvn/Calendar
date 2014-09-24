HelloWorld::Application.routes.draw do

  devise_for :users, :path => "auth",:controllers =>{passwords: "passwords", registrations: 'registrations'}
  #unless Rails.application.config.consider_all_requests_local
  #match '*not_found', to: 'errors#error_404'
  #end
  # The priority is based upon order of creation:
  # first created -> highest priority.
  resources :settings do
    post "normal_upload", :on => :collection
  end
  resources :categories
  resources :orders
  resources :organizations do
    resources :users

    resources :user_groups do
      get "get_available_user"
      get "add_user_to_group"
      get "update_permissions"
    end

    resources :activities
  end
  resources :calendars do
    get "contact",:on => :collection
    post "send_contact",:on => :collection
    get "product_contact"
    get "send_product_contact",:on =>:collection
    get "admin",:on =>:collection
  end
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'
  resources :home do
    get "introduction",:on => :collection
    get "pricing_page",:on => :collection
  end
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
