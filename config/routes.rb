Rails.application.routes.draw do
  root to: "home#index"

  resources :cards, only: %i[ index show ]
  resources :card_sets, only: %i[ index show ]

  get "about" => "about#about", as: "about"
  get "up" => "rails/health#show", as: :rails_health_check
end
