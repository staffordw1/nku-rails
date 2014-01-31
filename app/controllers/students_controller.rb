class StudentsController < ApplicationController
  
  def new
    @student = Student.new
  end
  
  def create
    @student = Student.new(student_params)
 
    if @student.save
      flash[:notice] = "Your profile has been added!"
      redirect_to students_path
    else
      render 'new'
    end
  end
  
  def show
    @student = Student.find(params[:id])
  end
  
  def index
      @students = Student.all
  end
  
  def edit
    @student = Student.find(params[:id])
  end
  
  def update
    @student = Student.find(params[:id])
    
    if @student.update(student_params)
      flash[:notice] = "Your profile has been updated!"
      redirect_to students_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    
    redirect_to students_path
  end
  
  private
  def student_params
    params.require(:student).permit(:name, :nickname, :email, :url)
  end
end
