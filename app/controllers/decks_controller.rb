class DecksController < ApplicationController
  def index
    @decks = Deck.all
  end

  def show
    @deck = find_deck
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(deck_params)
    if @deck.save
      redirect_to decks_path
    else
      render :new
    end
  end

  def edit
    @deck = find_deck
  end

  def update
    @deck = find_deck
    if @deck.update(deck_params)
      redirect_to @deck
    else
      render :edit
    end
  end

  def destroy
    deck = find_deck
    deck.destroy
    redirect_to decks_path
  end

  private

  def find_deck
    Deck.find(params[:id])
  end

  def deck_params
    params.require(:deck).permit(:name)
  end
end
