class CardSetsController < ApplicationController
  def index
    @card_sets = CardSet.all

    if params[:series].present?
      @card_sets = @card_sets.where(series: params[:series])
    end

    if params[:name].present?
      @card_sets = @card_sets.where("LOWER(name) LIKE ?", "%#{params[:name].downcase}%")
    end

    if params[:random].present? && params[:random] == "true"
      @card_sets = @card_sets.order("RANDOM()").limit(12)
    end

    if params[:sort].present?
      @card_sets =
        case params[:sort]
        when "name_asc"
          @card_sets.reorder("LOWER(card_sets.name) ASC")
        when "name_desc"
          @card_sets.reorder("LOWER(card_sets.name) DESC")
        else
          @card_sets
        end
    end

    if params[:release_order].present?
      @card_sets =
        case params[:release_order]
        when "newest"
          @card_sets.reorder(release_date: :desc)
        when "oldest"
          @card_sets.reorder(release_date: :asc)
        else
          @card_sets
        end
    end

    @card_sets = @card_sets.page(params[:page]).per(32)
  end

  def show
    @card_set = CardSet.find(params[:id])
    @cards = @card_set.cards.order(:name).page(params[:page]).per(16)
  end
end
