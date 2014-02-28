class StudentsController < ApplicationController
  def new
    @student = Student.new
  end
  
  def create
    @student = Student.new(student_params)
    if @student.save
      session[:student_id] = @student.id
      redirect_to students_path
    else
      flash[:error] = "Rejected."
      render "new"
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
    redirect_to session_path, method: :delete
  end
  
  private
  def student_params
    params.require(:student).permit(:name, :nickname, :email, :image_url, :password, :password_confirmation)
  end
end
