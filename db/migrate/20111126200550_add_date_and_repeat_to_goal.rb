class AddDateAndRepeatToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :date, :datetime
    add_column :goals, :repeat, :string
  end
end
