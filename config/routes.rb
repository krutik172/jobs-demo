Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :products do 
   
      post 'purchase', on: :member

  end
  # Defines the root path route ("/")
  # root "articles#index"
end
