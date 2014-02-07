class SessionsController < ApplicationController
  def new
  end
  
  def create
    student = Student.find_by_email(params[:email])
    if student && student.authenticate(params[:password])
      session[:student_id] = student.id
      redirect_to students_path(student.name), :notice => "Logged in!"
    else
      flash[:notice] = "Invalid email or password"
      render 'new'
    end
  end
  
  def destroy
    session[:student_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end