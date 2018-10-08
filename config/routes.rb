Rails.application.routes.draw do
 
  resources :books, only: [:show, :index] do
    collection do 
        get "search"
    end
  	resources :reviews, only: [:new, :create, :edit, :update] 
  end
  root to: "books#index"
end
