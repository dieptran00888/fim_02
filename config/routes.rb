Rails.application.routes.draw do
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
  resources :users, only: :show
  resources :songs, only: :show
  resources :albums, only: :show
end
