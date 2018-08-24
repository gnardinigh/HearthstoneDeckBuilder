class Deck < ApplicationRecord
  has_many :deck_cards
  has_many :cards, through: :deck_cards

  has_many :user_decks
  has_many :users, through: :user_decks

  def allcards
    self.deck_cards
  end

  # helper method for .card_addition_valid?
  def self.invalid_card?(card_id)
    self.last.deck_cards.select{|dc|dc.card_id==card_id}.count > 1
  end
  # helper method for .card_addition_valid?
  def self.deck_full?
    self.last.deck_cards.count > 29
  end

  def self.card_addition_valid?(card_id)
    Deck.valid_choice?(card_id) && Deck.not_full?
  end

end
