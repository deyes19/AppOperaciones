Rails.application.routes.draw do
  delete '/zones/:id', to:'zones#destroy'
  resources :centers
  resources :zones
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
