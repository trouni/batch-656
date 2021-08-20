Rails.application.routes.draw do
  resources :restaurants, only: [ :index, :show ] do
    resources :reviews, only: :create
  end
end
