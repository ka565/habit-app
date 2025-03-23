class HabitsController < ApplicationController
  def index
    @habits = Habit.all
  end

  
  def auto_increment_value
  @habits = Habit.all

  @habits.each do |habit|
    habit.auto_increment_value
  end

   redirect_to habits_path
  end


  def new 
    @habit = Habit.new
  end

  def create
    @habit = Habit.new(habit_params)
    @habit.current_value = @habit.goal_value
    if @habit.save
       redirect_to habits_path
    else
       render :new
  end
end

def edit
  @habit = Habit.find(params[:id])
end

def update
  @habit = Habit.find(params[:id])
  if @habit.update(habit_params)
    redirect_to habits_path
  else
    render :edit
  end
end

  def record
    @habit = Habit.find(params[:id])
  end

  def  update_record
    @habit = Habit.find(params[:id])
    actual_value = params[:habit][:actual_value].to_f
    new_goal_value = @habit.current_value - actual_value
    if @habit.update(current_value: new_goal_value, actual_value: actual_value)
      @habit.record_progress
      redirect_to habits_path
    else
      render :record
    end
  end

  def details
    @habit = Habit.find(params[:id])
    @progress_records = @habit.progress_records
  end

  def destroy_multiple
    puts "Received habit ids: #{params[:habit_ids].inspect}"
    if params[:habit_ids].present?
    Habit.where(id: params[:habit_ids]).destroy_all
    head :no_content
    else
      head :unprocessable_entity
    end
  end


private

def habit_params
  params.require(:habit).permit(:name,  :period, :current_value, :goal_value, :unit, :actual_value, :carryover_value, :goal_type, :start_date, :last_increment_date)
end

end


