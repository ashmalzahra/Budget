Rails.application.routes.draw do
  devise_for :users
  get 'splash/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories, only: [:index, :new, :create, :show] do
    resources :expenses, only: [:index, :new, :create]
  end
  # Defines the root path route ("/")
   root "splash#index"
end
