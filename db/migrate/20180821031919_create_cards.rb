class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :img
      t.integer :cost
      t.integer :attack
      t.integer :health
      t.string :rarity
      t.string :player_class
      t.string :race
      t.string :card_set

      t.timestamps
    end
  end
end
