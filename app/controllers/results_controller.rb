class ResultsController < ApplicationController
  def create
    @deck = find_deck_in_cards
    @card = find_card_in(@deck, params[:card_id])
    input = params["/decks/#{@deck.id}/cards/#{@card.id}/result"][:back]
    if input.downcase == @card.back.downcase
      render "right.html.erb"
    else
      render "wrong.html.erb"
    end
  end

end
