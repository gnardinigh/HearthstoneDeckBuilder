class DecksController < ApplicationController

  def index
    @cards = Card.all
    Deck.create()
  end

  def new
    @@chosen_class = params[:commit]
    @cards = Card.player_class(@@chosen_class)
    @neutral_cards = Card.player_class("Neutral")
    @selection_range = [{num:0},{num:1},{num:2}]
  end

  def add_to_deck
    repeat = params[:count][0].to_i
    repeat.times do
      DeckCard.create(deck_id: Deck.last.id, card_id: params[:count][-5..-1].to_i)
    end
    flash[:notice] = "Created #{repeat} instances of #{DeckCard.last.card.name} in deck number #{DeckCard.last.deck.id}."
    redirect_to new_deck_path(commit: @@chosen_class)
  end

  def create

  end




end
