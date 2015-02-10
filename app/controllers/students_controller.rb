class StudentsController < ApplicationController
  before_action :check_logged_in
  before_action :set_student, only: [:show, :edit, :update, :destroy, :edit_achievements, :update_achievements]

  def index
    @student = Student.all
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def edit_achievements
    @achievements = Achievement.all
  end

  def update_achievements
    @student.achievements = []
    params[:achievements].keys.each do |achievement_id|
      @student.achievements << Achievement.find_by_id(achievement_id)
    end
    redirect_to teachers_path
  end

  def create
    @student = Student.new(student_params)
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def show
    redirect_to teachers_path
  end

  private
  def set_student
    @student = Student.find(params[:id])
  end

  private
  def check_logged_in
    redirect_to login_login_path unless session[:student_id] || session[:teacher_id]
  end

  private
  def student_params
    params.require(:student).permit(:name, :student_email, :teacher_id, :password)
  end
end
