class DecksController < ApplicationController

  def index
    @cards = Card.all
    Deck.create()
  end

  def new
    @chosen_class = params[:commit]
    @cards = Card.player_class(@chosen_class)
    @neutral_cards = Card.player_class("Neutral")
    @selection_range = [{num:0},{num:1},{num:2}]
  end

  def add_to_deck

    @chosen_class = card_params[:class]
    @cid = card_params[:id]
    DeckCard.create(deck_id: Deck.last.id, card_id: @cid)
    flash[:notice] = "Created an instance of #{DeckCard.last.card.name} in deck number #{Deck.last.id}."
    redirect_to new_deck_path(commit: @chosen_class)

  end

  def create

  end

  private

  def card_params
    params.require("commit").permit("class","id")
  end



end
