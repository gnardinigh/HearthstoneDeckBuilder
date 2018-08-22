class DecksController < ApplicationController

  def index
    @cards = Card.all
  end

  def new
    @deck = Deck.create()
    @chosen_class = params[:commit]
    @cards = Card.player_class(@chosen_class)
    @neutral_cards = Card.player_class("Neutral")
    @selection_range = [{num:0},{num:1},{num:2}]
  end

  def add_to_deck
    params[:num_cards][0].to_i.times do
      DeckCard.create(deck_id: Deck.last.id, card_id: params[:num_cards][-5..-1].to_i)
    end
    byebug
  end

  def create

  end




end
