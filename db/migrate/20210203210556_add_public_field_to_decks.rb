class AddPublicFieldToDecks < ActiveRecord::Migration[5.0]
  def change
    add_column :decks, :public, :boolean
  end
end
