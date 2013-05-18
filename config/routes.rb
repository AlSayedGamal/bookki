Bookki::Application.routes.draw do

  match '/rate' => 'rater#create', :as => 'rate'

  devise_for :users
  resources :books

  resources :users do
    resources :books
  end


  root :to => 'books#index'
end
