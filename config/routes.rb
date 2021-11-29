Rails.application.routes.draw do
  resources :courses do
    # resources :reviews, shallow: true
    resources :reviews, only: [:create]
  end
  resources :reviews, only: [:destroy]

  root "courses#index"

  get "/about", to: "pages#about"

  # users function
  get "/sign_up", to: "users#sign_up"
  post "/account_verify", to: "users#account_verify"

  get "/sign_in", to: "users#sign_in"
  post "/sign_in/check", to: "users#check"

  delete "/sign_out", to: "users#sign_out"
end
