Rails.application.routes.draw do
  resources :rankactives
  devise_for :users
  scope '/admin' do
    resources :users
  end
  resources :roles
  resources :users
  resources :ubications do
    collection do
      post :import
    end
  end
  root "actives#index"
  resources :actives do
    collection do
      post :import
    end
  end
  resources :active_types
  resources :suppliers
  resources :kinds
  resources :brands
  resources :invoices
  resources :groups
  resources :destinations do
    collection do
      post :import
    end
  end
  resources :destinos 
  resources :centers do
    collection do
      post :import
    end
  end
  resources :zones do
  collection do
    post :import
  end
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
