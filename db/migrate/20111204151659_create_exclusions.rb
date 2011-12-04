class CreateExclusions < ActiveRecord::Migration
  def change
    create_table :exclusions do |t|
      t.integer :goal_id
      t.datetime :date

      t.timestamps
    end
  end
end
