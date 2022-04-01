class CoursesController < ApplicationController
  
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @course_chapter = @course.chapter
    @courses = Course.where(chapter_id:@course_chapter.id)
    #@courses_of_the_same_chapter = Course.where(chapter_id:@courses.chapter_id) #test
    #@next_course = Course.where(chapter_id:@courses.chapter_id, course_id:(@course.id +1)) #test for the button "next course"
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
    params.require(:chapter).permit(:title, :content, :chapter_id)
  end

end