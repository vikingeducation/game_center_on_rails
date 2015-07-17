class CreateConnectFours < ActiveRecord::Migration
  def change
    create_table :connect_fours do |t|
      t.string :game

      t.timestamps null: false
    end
  end
end
