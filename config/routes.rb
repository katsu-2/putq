Rails.application.routes.draw do
  root 'statics#home'
  resources :posts
end
