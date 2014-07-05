class CardsController < ApplicationController
  def new
    @deck = find_deck
    @card = Card.new
  end

  def create
    @deck = find_deck
    @card = @deck.cards.new(card_params)
    if @card.save
      redirect_to deck_path(params[:deck_id])
    else
      render :new
    end
  end

  def show
    @deck = find_deck
    @card = find_card_in(@deck)
  end

  def edit
    @deck = find_deck
    @card = find_card_in(@deck)
  end

  def update
    @deck = find_deck
    @card = find_card_in(@deck)
    if @card.update(card_params)
      redirect_to @deck
    else
      render :edit
    end
  end

  def destroy
    deck = find_deck
    card = find_card_in(deck)
    card.destroy

    redirect_to deck
  end

  def check
    deck = find_deck
    card = find_card_in(deck)
    input = params["/decks/#{deck.id}/cards/#{card.id}"][:back]
    if input.downcase == card.back.downcase
      render "right.html.erb"
    else
      render "wrong.html.erb"
    end
  end

  def random
    @deck = Deck.find(params[:id])
    @card = @deck.cards.sample
    redirect_to deck_card_path(@deck, @card.id)
  end

  private
  def find_deck
    Deck.find(params[:deck_id])
  end

  def find_card_in(deck)
    deck.cards.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:front, :back)
  end
end
