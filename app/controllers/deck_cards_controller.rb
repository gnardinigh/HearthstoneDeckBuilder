class DeckCardsController < ApplicationController

  def add_to_deck
    ApplicationController.render(template: 'decks/new')
    flash[:notice] = "Card Added! Congrats"
  end




end
