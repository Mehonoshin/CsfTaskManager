class RenameRepeat < ActiveRecord::Migration
  def up
    rename_column :goals, :repeat, :repeat_schedule
  end

  def down
  end
end
