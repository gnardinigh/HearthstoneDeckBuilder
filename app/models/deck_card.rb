class DeckCard < ApplicationRecord
  belongs_to :deck
  belongs_to :card

  def get_card(params)

  def add_to_deck
    @user_deck Deck.new
    #receive params

    @card_id = params[:count][-5..-1].to_sym
    @num_cards = params[:count][0].to_i

    hash ={}

    hash[@card_id.to_sym] = @num_cards

    if hash[@card_id] < 2 && hash.values.reduce(:+) < 30
      DeckCard.new()


    #pull chosen card
    @chosen_card = Card.find(@card_id)
    #
  end

end
