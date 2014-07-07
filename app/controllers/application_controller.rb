class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def find_deck_in_cards
    Deck.find(params[:deck_id])
  end

  def find_card_in(deck, id_params)
    deck.cards.find(id_params)
  end
end
