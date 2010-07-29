ActionController::Routing::Routes.draw do |map|
  map.resources :flight_selects

  map.resources :survey_users
  map.resources :controller
  map.resources :users

  map.resources :flights

  map.download '/download', :controller=>'survey_users', :action=>'download'  

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
   map.root :controller => "flights", :action=>"new"
#	map.root :controller => "users", :action => "index"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
