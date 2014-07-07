class CardsController < ApplicationController
  def new
    @deck = find_deck_in_cards
    @card = Card.new
  end

  def create
    @deck = find_deck_in_cards
    @card = @deck.cards.new(card_params)
    if @card.save
      redirect_to deck_path(params[:deck_id])
    else
      render :new
    end
  end

  def show
    @deck = find_deck_in_cards
    @card = find_card_in(@deck, params[:id])
  end

  def edit
    @deck = find_deck_in_cards
    @card = find_card_in(@deck, params[:id])
  end

  def update
    @deck = find_deck_in_cards
    @card = find_card_in(@deck, params[:id])
    if @card.update(card_params)
      redirect_to @deck
    else
      render :edit
    end
  end

  def destroy
    deck = find_deck_in_cards
    card = find_card_in(deck, params[:id])
    card.destroy

    redirect_to deck
  end

  private

  def card_params
    params.require(:card).permit(:front, :back)
  end
end
