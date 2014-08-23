Rails.application.routes.draw do
  devise_for :users

  resources :home, only: :index
  resources :dashboard, only: :index

  resources :places do
    resources :reviews
  end
  root 'home#index'

  resources :search
  resources :bookings do
    member do
      get 'accept'
      get 'decline'
    end
  end
end
