TicketTracker::Application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  get '/awaiting_confirmation', to: "users#confirmation", as: 'confirm_user'
  root :to => "projects#index"
  namespace :admin do
  	root :to => "base#index"
  	resources :users	
  end
  resources :projects do
  	resources :tickets
  end
  
end
