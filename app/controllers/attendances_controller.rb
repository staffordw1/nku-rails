class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
  end
  
  def index
    @attendances = Attendance.all
  end
  
  def create
    @attendance = Attendance.new
    @attendance.attended_on = params[:attended_on]
    @attendance.seat = params[:seat]
    @attendance.student_id = current_student.id
    if @attendance.save
      redirect_to attendances_path, :notice => "Successfully Logged!"
    else
      flash[:notice] = "Invalid form data"
      render 'new'
    end 
  end
  
  private
  def attendance_params
    params.permit(:attended_on, :seat, :student_id)
  end
end