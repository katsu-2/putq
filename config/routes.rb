Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  root 'posts#index'
  resources :users, only: [:index, :show]
  resources :folders do
    resources :posts
  end

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :categories, only: [:index, :show] do
    resources :child_categories, only: [:index, :show]
  end

end
