class CoursesController < ApplicationController
  
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @course_chapter = @course.chapter #YR Probably another unsuccessful attempt to display every courses and chapters in the side_bar
    @course_theme = @course.chapter.theme #YR Probably another unsuccessful attempt to display every courses and chapters in the side_bar
  end

  #def edit
  #end

  #def update
  #end

  #def new
  #end

  #def create
  #end

  #def destroy
  #end

end