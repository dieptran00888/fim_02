Rails.application.routes.draw do
  devise_for :users
  root "static_pages#show", page: "home"
  get "static_pages/*page", to: "static_pages#show"

  resources :users, only: :show
  namespace :admin do
    resources :categories, except: :show
    resources :users, only: [:index, :destroy]
  end
end
