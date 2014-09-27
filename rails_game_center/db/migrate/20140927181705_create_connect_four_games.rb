class CreateConnectFourGames < ActiveRecord::Migration
  def change
    create_table :connect_four_games do |t|

      t.timestamps
    end
  end
end
