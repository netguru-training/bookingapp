Rails.application.routes.draw do

  # root to: "users#new"
  devise_for :users
  resources :home, only: :index
  resources :places do
    resource :reviews
  end
  root 'home#index'



  resources :bookings do  
    member do
      get 'accept'
      get 'decline'
    end
  end
end
