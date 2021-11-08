Rails.application.routes.draw do
  get "/", to: "pages#index"
  get "/about", to: "pages#about"

  # root "pages#index"
end
