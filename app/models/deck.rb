class Deck < ApplicationRecord
  has_many :deck_cards
  has_many :cards, through: :deck_cards

  has_many :user_decks
  has_many :users, through: :user_decks

  

end
