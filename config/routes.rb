Bookki::Application.routes.draw do

  match '/rate' => 'rater#create', :as => 'rate'
  match "/ratings" => 'ratings#index', :as => 'ratings'

  devise_for :users
  resources :books
  resources :ratings
  resources :users do
    resources :books
    resources :ratings
  end


  root :to => 'books#index'
end
