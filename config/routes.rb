Rails.application.routes.draw do
  get "card_attacks/index"
  get "card_attacks/show"
  root to: "cards#index"
  resources :cards, only: [ :index, :show ]
  get "attacks/index"
  get "attacks/show"

  get "images/index"
  get "images/show"
  get "supertypes/index"
  get "supertypes/show"
  get "sets/index"
  get "sets/show"
  get "rarities/index"
  get "rarities/show"
  get "pokemon_types/index"
  get "pokemon_types/show"
  get "cards/show"
  get "about" => "about#about", as: "about"
  get "up" => "rails/health#show", as: :rails_health_check
end
