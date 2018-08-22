class AddCardIdToDecks < ActiveRecord::Migration[5.2]
  def change
    add_reference :decks, :card, foreign_key: true
  end
end
