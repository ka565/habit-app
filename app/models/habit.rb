class Habit < ApplicationRecord
  has_many :progress_records, dependent: :destroy

  def record_progress
    Rails.logger.info "======== record_progress 実行: current_value=#{current_value}========="
    record = progress_records.find_or_initialize_by(date: Date.today)
    record.value = current_value
    if record.save
      Rails.logger.info "======== 成功: progress_records に保存されました========="
    else
      Rails.logger.info "======== 失敗: #{record.errors.full_messages}========="
    end
  end

  def recent_progress(days = 7)
    progress_records.where("date >= ?", days.days.ago).order(:date)
  end
  
  def auto_increment_value
    Rails.logger.info "======== 加算前のcurrent_value: #{current_value}========="


    last_date = last_increment_date || start_date

    cycles_elapsed = ((Date.today - last_date) / period.to_f).floor

    return if cycles_elapsed <= 0

    increment_value = cycles_elapsed * goal_value

    self.current_value += increment_value

    self.last_increment_date = Date.today

     save!

     record_progress
     
     Rails.logger.info "======== 加算後のcurrent_value: #{current_value}========="

  end
end
