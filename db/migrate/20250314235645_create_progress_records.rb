class CreateProgressRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :progress_records do |t|
      t.references :habit, null: false, foreign_key: true
      t.date :date
      t.float :value

      t.timestamps
    end
  end
end
