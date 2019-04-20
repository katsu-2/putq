Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  root 'posts#index'
  resources :users, only: [:index, :show]
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
end
