class CardsController < ApplicationController
  def index
    @cards = Card.all

    if params[:name].present?
      @cards = @cards.where("LOWER(cards.name) LIKE ?", "%#{params[:name].downcase}%")
    end

    if params[:card_set_id].present?
      @cards = @cards.where(card_set_id: params[:card_set_id])
    end

    if params[:series].present?
      set_ids = CardSet.where(series: params[:series]).pluck(:id)
      @cards = @cards.where(card_set_id: set_ids)
    end

    if params[:rarity_id].present?
      @cards = @cards.where(rarity_id: params[:rarity_id])
    end

    if params[:pokemon_type_id].present?
      @cards = @cards.where(pokemon_type_id: params[:pokemon_type_id])
    end

    if params[:supertype_id].present?
      @cards = @cards.where(supertype_id: params[:supertype_id])
    end

    if params[:attack_id].present?
      @cards = @cards.joins(:attacks)
                    .where(attacks: { name: params[:attack_id] })
                    .select("DISTINCT cards.*")
    end

    @cards = case params[:sort]
    when "name_asc"
      @cards.reorder("LOWER(cards.name) ASC")
    when "name_desc"
      @cards.reorder("LOWER(cards.name) DESC")
    else
      @cards.reorder("cards.id ASC")
    end

  @cards = @cards.page(params[:page]).per(24)
  end

  def show
    @card = Card.find(params[:id])
  end
end
