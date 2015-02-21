class CreateRockPaperScissors < ActiveRecord::Migration
  def change
    create_table :rock_paper_scissors do |t|

      t.timestamps
    end
  end
end
