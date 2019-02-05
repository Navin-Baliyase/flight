Rails.application.routes.draw do
    root :to => "users#home"
	resources :users
	resources :airplanes
	#resources :bookings
	get "ticket" => "airplanes#ticket", :as => "ticket"
	get "book" => "airplanes#book", :as => "book"
	get "logout" => "users#destroy_login", :as => "logout"
    get "login" => "users#verify_login", :as => "login"
    post "finalize" => "users#finalize", :as => "finalize"
    get "search" => "airplanes#search", :as => "search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
