class CardsController < ApplicationController

  def index
    @cards = Card.player_class("Mage")
    @neutral_cards = Card.player_class("Neutral")
  end



end
