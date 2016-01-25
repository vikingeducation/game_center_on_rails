class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :game_board

      t.timestamps null: false
    end
  end
end
