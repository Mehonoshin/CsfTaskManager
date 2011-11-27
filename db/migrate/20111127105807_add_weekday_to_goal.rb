class AddWeekdayToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :weekday, :integer
  end
end
