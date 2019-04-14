Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :users, only: [:index, :show]
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
end
