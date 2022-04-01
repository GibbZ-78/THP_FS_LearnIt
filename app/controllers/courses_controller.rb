class CoursesController < ApplicationController
  
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @course_chapter = @course.chapter  #YR Probably another unsuccessful attempt to display every courses and chapters in the side_bar
    @course_theme = @course.chapter.theme  #YR Probably another unsuccessful attempt to display every courses and chapters in the side_bar
  end

  def new
    @course = Course.new
  end

  def create
    Course.create(clean_params)
    redirect_to dashboard_admin_path
  end

  def edit
    @course = Course.find(params[:id]) 
  end

  def update
    @course = Course.find(params[:id])
    @course.update(clean_params)
    redirect_to dashboard_admin_path
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to dashboard_admin_path
  end

  private

  def clean_params
    params.require(:chapter).permit(:title, :content, :chapter_id)
  end

end