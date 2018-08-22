class DeckCard < ApplicationRecord
  belongs_to :deck
  belongs_to :card

  def get_card(params)
    @card_id = params[:count][-5..-1].to_sym
    @num_cards = params[:count][0].to_i
    [@card_id,@num_cards]
  end

  def add_to_deck
    @card = get_card(params)
    @deck ={}

  end

    #receive params

  def create

    deck.each do |card,num|
      DeckCard.create(card_id,deck_id)
    end
  end




    hash[@card_id.to_sym] = @num_cards


      DeckCard.new()


    #pull chosen card
    @chosen_card = Card.find(@card_id)
    #
  end

end
