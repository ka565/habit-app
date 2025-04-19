class CreateActualValueRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :actual_value_records do |t|
      t.references :habit, null: false, foreign_key: true
      t.date :date
      t.float :value

      t.timestamps
    end
  end
end
