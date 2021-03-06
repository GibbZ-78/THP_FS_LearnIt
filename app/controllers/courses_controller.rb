class CoursesController < ApplicationController
  
  before_action :require_admin, except: :show

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @course_chapter = @course.chapter
    @courses = Course.where(chapter_id:@course_chapter.id)
    @next_course = Course.find_by_id(params[:id].to_i + 1)
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
    params.require(:course).permit(:title, :content, :chapter_id)
  end

  def require_admin
    if !user_signed_in? || current_user.what_role? != "admin"
      redirect_to root_path
    end
  end

end