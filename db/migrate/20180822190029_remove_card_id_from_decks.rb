class RemoveCardIdFromDecks < ActiveRecord::Migration[5.2]
  def change
    remove_reference :decks, :card, foreign_key: true
  end
end
