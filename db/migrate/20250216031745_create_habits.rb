class CreateHabits < ActiveRecord::Migration[8.0]
  def change
    create_table :habits do |t|
      t.integer :user_id
      t.string :name
      t.decimal :goal_value
      t.string :unit
      t.decimal :actual_value
      t.decimal :carryover_value
      t.string :goal_type
      t.date :start_date

      t.timestamps
    end
  end
end
