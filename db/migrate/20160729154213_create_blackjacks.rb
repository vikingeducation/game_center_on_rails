class CreateBlackjacks < ActiveRecord::Migration
  def change
    create_table :blackjacks do |t|

      t.timestamps null: false
    end
  end
end
