class CreateRpsGames < ActiveRecord::Migration
  def change
    create_table :rps_games do |t|

      t.timestamps
    end
  end
end
