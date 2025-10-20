Rails.application.routes.draw do
  get "cards/index"
  get "cards/show"
  get "about" => "about#about", as: "about"
  get "up" => "rails/health#show", as: :rails_health_check
end
