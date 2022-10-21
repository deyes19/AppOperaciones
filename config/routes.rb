Rails.application.routes.draw do
  root "actives#index"
  resources :actives
  resources :active_types
  resources :suppliers
  resources :kinds
  resources :brands
  resources :responsibles
  resources :invoices
  resources :groups
  resources :destinations
  resources :destinos
  resources :centers
  resources :zones
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
