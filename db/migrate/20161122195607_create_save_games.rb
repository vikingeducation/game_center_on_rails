class CreateSaveGames < ActiveRecord::Migration[5.0]
  def change
    create_table :save_games do |t|
      t.string :board

      t.timestamps
    end
  end
end
