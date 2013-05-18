Bookki::Application.routes.draw do

  resources :books


  devise_for :users
  resources :books
  root :to => 'books#index'
end
