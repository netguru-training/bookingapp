Rails.application.routes.draw do
  root 'home#index'
  # root to: "users#new"
  Add Index and show views for bookings
  devise_for :users

  resources :home, only: :index
  resources :dashboard, only: :index

  resources :places do
    resources :reviews
  end


  resources :search
  resources :bookings do
    member do
      post :accept
      post :decline
    end
  end
end
