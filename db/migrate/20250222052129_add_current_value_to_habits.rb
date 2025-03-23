class AddCurrentValueToHabits < ActiveRecord::Migration[8.0]
  def change
    add_column :habits, :current_value, :decimal, default:0.0
  end
end
