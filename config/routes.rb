Rails.application.routes.draw do
 
  get 'users/show'
  devise_for :users
  resources :users, only: :show

  resources :books, only: [:show, :index] do
    collection do 
        get "search"
    end
  	resources :reviews, only: [:new, :create, :edit, :update, :destroy] 
  end

  root to: "books#index"
end
