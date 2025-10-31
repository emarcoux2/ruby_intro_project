class HomeController < ApplicationController
  def index
    @cards = Card.includes(:card_set, :image_url).order("RANDOM()").limit(12)
    @card_sets = CardSet.order("RANDOM()").limit(12)
  end
end