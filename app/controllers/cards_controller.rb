class CardsController < ApplicationController

  def index
    @cards = Card.player_class("Mage")
    @heroes = Card.heroes
  end



end
