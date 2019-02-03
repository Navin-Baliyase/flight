Rails.application.routes.draw do
    root :to => "users#home"
	resources :users
	resources :airplanes
	#resources :bookings
	get "book" => "airplanes#book", :as => "book"
	get "logout" => "users#destroy_login", :as => "logout"
    get "login" => "users#verify_login", :as => "login"
    post "finalize" => "users#finalize", :as => "finalize"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
