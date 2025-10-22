Rails.application.routes.draw do
  root to: "cards#index"
  get "images/index"
  get "images/show"
  get "supertypes/index"
  get "supertypes/show"
  get "sets/index"
  get "sets/show"
  get "rarities/index"
  get "rarities/show"
  get "card_types/index"
  get "card_types/show"
  get "cards/show"
  get "about" => "about#about", as: "about"
  get "up" => "rails/health#show", as: :rails_health_check
end
