Rails.application.routes.draw do
  get 'categories/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories, only: [:index, :new, :create] do
    resources :expenses, only: [:index, :new, :create]
  end
  # Defines the root path route ("/")
   root "categories#index"
end
