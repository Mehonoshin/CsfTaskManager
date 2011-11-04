class AddRoleIdToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :role_id, :integer
  end
end
