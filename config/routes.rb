Rails.application.routes.draw do
  devise_for :users
  root "static_pages#show", page: "home"
  get "static_pages/*page", to: "static_pages#show"

  namespace :admin do
    resources :users, only: [:index, :destroy]
  end

  resources :users, only: :show
end
