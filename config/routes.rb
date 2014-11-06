Rails.application.routes.draw do
  get :index, to: "home#index"
  root "home#index"
end
