class CreateConnect4s < ActiveRecord::Migration
  def change
    create_table :connect4s do |t|

      t.timestamps null: false
    end
  end
end
