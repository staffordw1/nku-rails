class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
  end
  
  def index
    if params[:id].present?
      @attendances = Student.find(params[:id]).attendances
    else
      @attendances = Attendance.all
    end
  end
  
  def create
    @attendances = Attendance.all
    @attendances.each do |attendance|
      if attendance.student_id == current_student.id && attendance.attended_on == Date.today
        redirect_to attendances_path, :notice => "You have already logged your attendance for today."
        return
      end
    end
    if params[:seat] == ""
      flash[:notice] = "You didn't enter anything..."
      render 'new'
      return
    end
    
    if params[:seat].to_f < 0 || params[:seat].to_f > 4
      flash[:notice] = "That number is out of range, try again please."
      render 'new'
      return
    end
    @attendance = Attendance.new
    @attendance.attended_on = Date.today
    @attendance.seat = params[:seat]
    @attendance.student_id = current_student.id
      
    if @attendance.save
      redirect_to attendances_path, :notice => "Successfully Logged!"
    else
      flash[:notice] = "You must submit a seat number."
      render 'new'
    end 
  end
  
  private
  def attendance_params
    params.permit(:attended_on, :seat, :student_id)
  end
end