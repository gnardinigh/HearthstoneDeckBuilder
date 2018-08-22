class Card < ApplicationRecord
  has_many :deck_cards
  has_many :decks, through: :deck_cards
  # belongs_to :deck

  def self.player_class(player_class)
    Card.all.select{|card|card.player_class==player_class&&card.race!="Hero"}.sort_by{|card| [card.cost,card.name]}
  end

  def self.heroes
    Card.all.select{|card| card.race == "Hero"}
  end

end
