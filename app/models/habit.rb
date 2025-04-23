class Habit < ApplicationRecord
  has_many :progress_records, dependent: :destroy
  has_many :actual_value_records, dependent: :destroy

  validates :name, presence: true, on: [:create, :update]
  validates :period, numericality: {only_integer: true, greater_than_or_equal_to: 1}, on: [:create, :update]
  validates :goal_value, numericality: {greater_than: 0},  on: [:create, :update]
  validates :unit, presence: true, on: [:create, :update]
  validates :goal_type, presence: true, on: [:create, :update]
  validates :start_date, presence: true, on: [:create, :update]
  validates :actual_value, numericality: {greater_than: 0},  on: :update_record
  
  

  def record_progress
    record = progress_records.find_or_initialize_by(date: Date.today)
    record.value = current_value
    record.save
  end

  def record_actual_value
    record = actual_value_records.create(date: Date.today, value: self.actual_value)
  end
  
  def auto_increment_value


    last_date = last_increment_date || start_date

    cycles_elapsed = ((Date.today - last_date) / period.to_f).floor

    return if cycles_elapsed <= 0

    increment_value = cycles_elapsed * goal_value

    self.current_value += increment_value

    self.last_increment_date = Date.today

     save!

     record_progress
     

  end
end
