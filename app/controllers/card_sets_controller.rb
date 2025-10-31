class CardSetsController < ApplicationController
  def index
    @card_sets = CardSet.where(id: CardSet.select("MIN(id)")
                        .group(:name))
                        .order(:name)
                        .page(params[:page])
                        .per(32)

    @card_sets = @card_sets.page(params[:page]).per(32)

    @card_sets = @card_sets.where(series: params[:series]) if params[:series].present?

    if params[:name].present?
      @card_sets = @card_sets.where("name LIKE ?", "%#{params[:name]}%")
    end

    if params[:random].present? && params[:random] == "true"
      @card_sets = @card_sets.order("RANDOM()").limit(12)
    end

    @card_sets = @card_sets.page(params[:page]).per(32)
  end

  def show
    @card_set = CardSet.find(params[:id])
    @cards = @card_set.cards.order(:name).page(params[:page]).per(16)
  end
end
