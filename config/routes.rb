require 'resque_web'

AswbPrototype::Application.routes.draw do

  # I like having this to populate the navbar with, via the database rather than do it in the views.
  resources :navbar_entries
  resources :changes
  
  resources :jurisdictions do
    resources :licensed_practices
    member do
      post 'suggest_draft/:attribute_key', action: 'suggest_draft'
    end
  end
  
  resources :static

  # Logins and Profiles
  devise_for :users
  resources :users, path: 'profiles'

  # The rest of the routes file is probably useless to most new apps based on this template, EXCEPT for the 
  # 404 catchall below which has to always be at the end.

  # Adds RailsAdmin
  mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'
  
  # Need a catch all to redirect to the errors controller, for catching 404s as an exception
  match "*path", to: "errors#catch_404", via: [:get, :post]

end
