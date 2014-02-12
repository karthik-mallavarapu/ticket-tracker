TicketTracker::Application.routes.draw do
  devise_for :users
  root :to => "projects#index"
  namespace :admin do
  	root :to => "base#index"
  	resources :users	
  end
  resources :projects do
  	resources :tickets
  end
  
end
