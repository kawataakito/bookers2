Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  get "/home/about" => "homes#about", as: "about"

  resources :users, only: [:show, :edit, :index, :update]
  resources :books, only: [:create, :index, :show, :edit, :destroy, :update]


end
