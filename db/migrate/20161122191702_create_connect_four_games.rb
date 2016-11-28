class CreateConnectFourGames < ActiveRecord::Migration[5.0]
  def change
    create_table :connect_four_games do |t|

      t.timestamps
    end
  end
end
