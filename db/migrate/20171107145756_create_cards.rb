class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :suit
      t.string :number
      t.integer :value
      t.string :name

      t.timestamps
    end
  end
end
