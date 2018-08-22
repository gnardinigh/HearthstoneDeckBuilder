class DecksController < ApplicationController

  def index
    @cards = Card.player_class("Mage")
    @neutral_cards = Card.player_class("Neutral")
    byebug
  end

  def new

  end


  def add_to_deck
    byebug
  end


end
