class ChangeCardsStatus < ActiveRecord::Migration[5.0]
  def change
  	change_table :cards do |t|
      t.remove :status
  	end
  
 	change_table :cards do |t|
      t.column :status, :integer, default: 0
  	end
  end
end
