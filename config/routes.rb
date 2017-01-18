Rails.application.routes.draw do
  post "/rate", to: "rater#create", as: "rate"
  devise_for :users, controllers: {omniauth_callbacks: :"callbacks#create"}
  root "static_pages#show", page: "home"
  get "static_pages/*page", to: "static_pages#show"
  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :categories, except: :show
    get "categories/new/(:parent_id)", to: "categories#new",
      as: "new_sub_category"
    resources :artists, except: :show
    resources :albums, except: :show
    resources :dashboard, only: :index
  end
  resources :users, only: :show do
    member do
      resources :albums, only: [:new, :create]
    end
  end
  resources :songs, only: :show do
    resources :comments
    get "/comments/new/(:parent_id)", to: "comments#new", as: :new_comment
    resources :lyrics, only: [:new, :create]
  end
  resources :albums, only: :show do
    resources :comments
    get "/comments/new/(:parent_id)", to: "comments#new", as: :new_comment
  end
  resources :marks, only: [:new, :create, :update]
end
