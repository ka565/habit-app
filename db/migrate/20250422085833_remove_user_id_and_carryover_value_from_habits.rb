class RemoveUserIdAndCarryoverValueFromHabits < ActiveRecord::Migration[8.0]
  def change
    remove_column :habits, :user_id, :integer
    remove_column :habits, :carryover_value, :decimal
  end
end
