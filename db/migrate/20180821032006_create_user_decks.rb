class CreateUserDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_decks do |t|
      t.references :user, foreign_key: true
      t.references :deck, foreign_key: true

      t.timestamps
    end
  end
end
