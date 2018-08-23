class DecksController < ApplicationController

  def index
    @cards = Card.all
    Deck.create()
  end

  def new
    @chosen_class = params[:commit]
    @@holdclass = @chosen_class
    @cards = Card.player_class(@chosen_class)
    @neutral_cards = Card.player_class("Neutral")
    @selection_range = [{num:0},{num:1},{num:2}]
  end

  def add_to_deck
    @chosen_class = @@holdclass
    repeat = card_params.values[0].to_i
    # byebug
    repeat.times do
      DeckCard.create(deck_id: Deck.last.id, card_id: card_params.keys[0].to_i)
    end
    flash[:notice] = "Created #{repeat} instances of #{DeckCard.last.card.name} in deck number #{Deck.last.id}."
    redirect_to new_deck_path(commit: @chosen_class)
  end

  def create

  end

  private

  def card_params
    params.require("card_choice").permit(Card.all.map{|card|card.id.to_s})
  end



end
