class AddLastIncrementDateToHabits < ActiveRecord::Migration[8.0]
  def change
    add_column :habits, :last_increment_date, :date
  end
end
