Rails.application.routes.draw do
  root "pages#index"

  get "/about", to: "pages#about"

  # users function
  get "/sign_up", to: "users#sign_up"
  post "/account_verify", to: "users#account_verify"
end
