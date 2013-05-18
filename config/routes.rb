Bookki::Application.routes.draw do

  match '/rate' => 'rater#create', :as => 'rate'

  resources :books


  devise_for :users
  resources :books
  root :to => 'books#index'
end
