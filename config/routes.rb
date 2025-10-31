Rails.application.routes.draw do
  root to: "home#index"

  resources :cards, only: %i[ index show ]
  resources :card_sets, only: %i[ index show ]

  get "card_attacks/index"
  get "card_attacks/show"
  get "attacks/index"
  get "attacks/show"
  get "images/index"
  get "images/show"
  get "supertypes/index"
  get "supertypes/show"
  get "rarities/index"
  get "rarities/show"
  get "pokemon_types/index"
  get "pokemon_types/show"
  get "about" => "about#about", as: "about"
  get "up" => "rails/health#show", as: :rails_health_check
end
