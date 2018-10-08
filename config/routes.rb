Rails.application.routes.draw do
  resources :books, only: [:show, :index] do
  	collection do 
  		get "search"
  	end
  end
  root to: "books#index"
end
