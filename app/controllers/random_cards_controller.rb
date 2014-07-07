class RandomCardsController < ApplicationController
  def show
    @deck = Deck.find(params[:deck_id])
    @card = @deck.cards.sample
    redirect_to deck_card_path(@deck, @card.id)
  end

end
