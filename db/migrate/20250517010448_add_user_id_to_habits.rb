class AddUserIdToHabits < ActiveRecord::Migration[8.0]
  def change
    add_column :habits, :user_id, :integer
    add_foreign_key :habits, :users
    add_index :habits, :user_id
  end
end
