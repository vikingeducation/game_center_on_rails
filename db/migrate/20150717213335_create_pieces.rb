class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.integer "x_value"
      t.integer "y_value"

      t.integer "color"

      t.timestamps null: false
    end
  end
end
