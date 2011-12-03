class AddPriorityToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :priority, :string
  end
end
