Rails.application.routes.draw do
  root 'home#index'
  # root to: "users#new"
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

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
