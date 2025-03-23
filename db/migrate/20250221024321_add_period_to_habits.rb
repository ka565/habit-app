class AddPeriodToHabits < ActiveRecord::Migration[8.0]
  def change
    add_column :habits, :period, :integer
  end
end
