class CreateRps < ActiveRecord::Migration
  def change
    create_table :rps do |t|

      t.timestamps null: false
    end
  end
end
