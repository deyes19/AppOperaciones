Rails.application.routes.draw do
  devise_for :users
<<<<<<< HEAD
  root 'pages#home'
  resources :ubications
=======
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
>>>>>>> commit-huerfano
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
