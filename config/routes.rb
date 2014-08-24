Rails.application.routes.draw do
  root 'home#index'
  # root to: "users#new"
  # Add Index and show views for bookings
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  devise_scope :user do
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

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
