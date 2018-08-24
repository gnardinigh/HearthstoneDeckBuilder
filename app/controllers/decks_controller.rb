class DecksController < ApplicationController

  def index
    @cards = Card.all
    @currentdeck = Deck.create()
  end

  def new
    @currentdeck = Deck.find_by(id: params[:currentdeck])
    @chosen_class = params[:commit]
    @cards = Card.player_class(@chosen_class)
    @neutral_cards = Card.player_class("Neutral")
    @selection_range = [{num:0},{num:1},{num:2}]
  end

  def add_to_deck

    @chosen_class = params[:commit]
    @cid = params[:id].to_i

    if Deck.deck_full?
      flash[:notice] = "Deck is full! Cannot add more cards."
    elsif Deck.invalid_card?(@cid)
      user_card = Card.find(@cid).name
      flash[:notice] = "You cannot add any more #{user_card}s to your deck! Already contains 2."
    else
      DeckCard.create(deck_id: Deck.last.id, card_id: @cid)
      flash[:notice] = "Created an instance of #{DeckCard.last.card.name} in deck number #{Deck.last.id}. Your deck now contains #{Deck.last.deck_cards.count} cards."
    end
    redirect_to new_deck_path(commit: @chosen_class, currentdeck: Deck.last)
  end

  def create

  end

  private

  def card_params
    params.require("commit").permit("class","id")
  end



end
