class CardsController < ApplicationController

  def index
    @cards = Card.player_class("Mage")
    @neutral_cards = Card.player_class("Neutral")
    @selection_range = [{num:0},{num:1},{num:2}]
  end

  def add_to_deck
    byebug
  end


end
