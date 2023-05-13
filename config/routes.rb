Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
  resources :categories, only: %i[index show new create destroy] do
    resources :expenses, only: [:new, :create ]
  end
end
